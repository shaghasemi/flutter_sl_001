import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/provider_test/cart_product_list.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:provider/provider.dart';

enum order_options {
  blank,
  number,
  number_calculating,
  number_packing,
  number_calculating_packing
}

class ProductSingleScreen extends StatefulWidget {
  final String product_id;

  const ProductSingleScreen({
    Key? key,
    required this.product_id,
  }) : super(key: key);

  @override
  State<ProductSingleScreen> createState() => _ProductSingleScreenState();
}

class _ProductSingleScreenState extends State<ProductSingleScreen> {
  ApiServiceProduct apiServiceProduct = ApiServiceProduct();
  late ProductSingleRequestModel productSingleRequestModel;
  ProcessingRequestModel processingRequestModel =
      ProcessingRequestModel(orderList: []);
  ProductSingleData productSingleData = ProductSingleData();
  String dropdownValue = 'One';
  int ratioUnit = 1;
  order_options case_property = order_options.blank;
  double vertical_distance = 20.0;

  String dropDownPacking = 'انتخاب بسته بندی';
  String dropDownCalculating = 'انتخاب مقدار';

  @override
  void initState() {
    super.initState();
    productSingleRequestModel =
        ProductSingleRequestModel(id: widget.product_id);
  }

  Widget build(BuildContext context) {
    Future<ProductSingleData> getSingleProductData() =>
        apiServiceProduct.productSingle(productSingleRequestModel);
    return FutureBuilder(
      future: getSingleProductData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          productSingleData =
              ProductSingleData.fromJson(jsonDecode(jsonEncode(snapshot.data)));
          if (productSingleData.packList!.length == 0) {
            if (productSingleData.itemId!.propertyList![0].calculating !=
                true) {
              // Case 11: Number of Order
              case_property = order_options.number;
            } else {
              // Case 12: Number of Order & Calculating Property List
              case_property = order_options.number_calculating;
            }
          } else {
            if (productSingleData.itemId!.propertyList![0].calculating !=
                true) {
              // Case 21: Number of Order & Packing List
              case_property = order_options.number_packing;
            } else {
              // Case 22: Number of Order & Packing List & Calculating Property List
              case_property = order_options.number_calculating_packing;
            }
          }
          print("case_property.toString()");
          print(case_property.toString());
          return NestedScrollView(
            scrollDirection: Axis.vertical,
            headerSliverBuilder: (context, innerBoxIsScroller) => [
              SliverAppBar(
                elevation: 24,
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  PopupMenuButton<int>(
                    onSelected: (item) => handleClick(item),
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.compare,
                              color: Colors.black,
                            ),
                            Text('مقایسه'),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        height: 30,
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            Text('به اشتراک گذاری'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                backgroundColor: Color(0xff28a745),
                snap: true,
                centerTitle: true,
                floating: true,
              ),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Image Slider
                  ImageSliderProduct(context),
                  SizedBox(height: vertical_distance),

                  // Product Title
                  Text(productSingleData.titleFa!),
                  SizedBox(height: vertical_distance),

                  // Product Code
                  Text(
                    'کد محصول: ${productSingleData.trackingCode!}',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(height: vertical_distance),

                  // Price per Item
                  Text(
                    'قیمت هر ${productSingleData.unit}: ${productSingleData.price!}',
                  ),
                  SizedBox(height: vertical_distance),

                  MinMaxOrder(),
                  SizedBox(height: vertical_distance),

                  // Discount based on order quantity
                  DiscountConditional(),
                  SizedBox(height: vertical_distance),

                  // Order Options
                  OrderOptions(case_property),

                  // Geographical Information
                  // Card(),

                  Text(productSingleData.titleFa!),
                  SizedBox(height: vertical_distance),

                  Text(productSingleData.titleFa!),
                  SizedBox(height: vertical_distance),

                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<CartProductList>(context, listen: false)
                            .addProductToCart(
                      // id: productInfo.id.toString(),
                      id: productSingleData.id!,
                    ),
                    child: Text("افزودن به سبد خرید"),
                  ),
                  SizedBox(height: vertical_distance),
                  SizedBox(height: vertical_distance),
                  SizedBox(height: vertical_distance),
                  SizedBox(height: vertical_distance),
                  SizedBox(height: vertical_distance),
                  SizedBox(height: vertical_distance),
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: 180,
            width: 180,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Container ImageSliderProduct(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: productSingleData.images!.length,
          itemBuilder: (context, index) {
            return Image.network(
              "${AppUrl.imageBaseUrl}${productSingleData.images![index].url}",
              // height: 240,
              width: MediaQuery.of(context).size.width * .8,
            );
          },
        ),
      ),
    );
  }

  Card OrderOptions(case_property) {
    return Card(
      child: Column(
        children: [
          Text('اطلاعات سفارش'),
          SizedBox(height: vertical_distance),

          // Select Packing if available
          if (case_property == order_options.number_packing ||
              case_property == order_options.number_calculating_packing)
            DropdownButton<String>(
              hint: Opacity(
                opacity: 0.5,
                child: Text(
                  'بسته بندی',
                ),
              ),
              items: productSingleData.packList!
                  .map<DropdownMenuItem<String>>((PackList object) {
                return DropdownMenuItem<String>(
                  value: object.ratioUnit,
                  child: Text(object.name!),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),

          // Select Calculating Property if available
          if (case_property == order_options.number_calculating ||
              case_property == order_options.number_calculating_packing)
            DropdownButton<String>(
              /*value: dropDownCalculating != ''
                  ? productSingleData.itemId!.propertyList![0].selectList![0]
                  : null,*/
              // value: productSingleData.itemId!.propertyList![0].selectList![0],
              // value: productSingleData.itemId!.propertyList![0].selectList![1],
              value: productSingleData.itemId!.propertyList![0].nameFa,
              // value: dropDownCalculating,
              hint: Opacity(
                opacity: 0.5,
                child: Text(productSingleData.itemId!.propertyList![0].nameFa!),
              ),
              items: productSingleData.itemId!.propertyList![0].selectList!
                  .map<DropdownMenuItem<String>>((String object) {
                return DropdownMenuItem<String>(
                  value: object,
                  child: Text(object /*.toString()*/),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownCalculating = newValue!;
                });
              },
            ),

          // Available in all cases - Order Quantity
          TextField(
            decoration: InputDecoration(hintText: 'تعداد'),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              processingRequestModel.orderList![0].number = int.parse(input);
            },
          )
        ],
      ),
    );
  }

  Column DiscountConditional() {
    return Column(
      children: [
        Text('درصد تخفیف به ازای تعداد سفارش'),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productSingleData.priceRatioRangeList!.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text('از '),
                Text(productSingleData.priceRatioRangeList![index].start
                    .toString()),
                Text(' تا '),
                Text(productSingleData.priceRatioRangeList![index].end
                    .toString()),
                Text(productSingleData.unit.toString()),
                Text(productSingleData.priceRatioRangeList![index].ratioPrice
                    .toString()),
                Text(' درصد'),
              ],
            );
          },
        )
      ],
    );
  }

  Row MinMaxOrder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text('حداقل سفارش: '),
            Text(productSingleData.minOrder.toString()),
          ],
        ),
        Row(
          children: [
            Text('حداکثر سفارش: '),
            Text(productSingleData.maxOrder.toString()),
          ],
        ),
      ],
    );
  }

  void addToCart() {
    processingRequestModel.orderList![0].id = widget.product_id;
    processingRequestModel.orderList![0].packId = widget.product_id;
  }

/*let data = {
    order_list: [
      {
        _id: product_info_data.data._id,
        pack_id: pack ? pack : null,
        number: parseInt(count),
        selected_property_id_list:
        calculatingProperty.length > 0
            ? [
          {
            property_name: calculatingProperty[0]?.name_fa,
            part_id: property            property_id: TrueProperty[0]?._id,

          }
        ]
            : null,
        address: address,
        lat: position ? position[0] : '',
        lon: position ? position[1] : '',
        province: province,
        city: city
      }
    ]
  }*/
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
  }
}
