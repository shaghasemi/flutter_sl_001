import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/provider_test/cart_product_list.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:provider/provider.dart';

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
  ProcessingRequestModel processingRequestModel = ProcessingRequestModel(
      orderList: []);
  ProductSingleData productSingleData = ProductSingleData();
  String dropdownValue = 'One';
  int ratioUnit = 1;
  int case_property = 0;
  double vertical_distance = 20.0;

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
            if (productSingleData.itemId!.propertyList![0].calculating != true) {
              // Case 11: Number of Order
              case_property = 11;
            } else {
              // Case 12: Number of Order & Calculating Property List
              case_property = 12;
            }
          } else {
            if (productSingleData.itemId!.propertyList![0].calculating != true) {
              // Case 21: Number of Order & Packing List
              case_property = 21;
            } else {
              // Case 22: Number of Order & Packing List & Calculating Property List
              case_property = 22;
            }
          }
          return NestedScrollView(
            scrollDirection: Axis.vertical,
            headerSliverBuilder: (context, innerBoxIsScroller) =>
            [
              SliverAppBar(
                elevation: 24,
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  PopupMenuButton<int>(
                    onSelected: (item) => handleClick(item),
                    itemBuilder: (context) =>
                    [
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
                  Container(
                    height: 300,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: productSingleData.images!.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            "${AppUrl.imageBaseUrl}${productSingleData
                                .images![index].url}",
                            // height: 240,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .8,
                          );
                        },
                      ),
                    ),
                  ),

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
                    'قیمت هر ${productSingleData.unit}: ${productSingleData
                        .price!}',
                    // style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(height: vertical_distance),

                  Row(
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
                  ),
                  SizedBox(height: vertical_distance),

                  // Discount based on order quantity
                  Column(
                    children: [
                      Text('درصد تخفیف به ازای بازه ی خرید'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                        productSingleData.priceRatioRangeList!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text('از '),
                              Text(productSingleData
                                  .priceRatioRangeList![index].start
                                  .toString()),
                              Text(' تا '),
                              Text(productSingleData
                                  .priceRatioRangeList![index].end
                                  .toString()),
                              Text(productSingleData.unit.toString()),
                              Text(productSingleData
                                  .priceRatioRangeList![index].ratioPrice
                                  .toString()),
                              Text(' درصد'),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: vertical_distance),

                  // Order Options
                  Card(
                    child: Column(
                      children: [
                        Text('اطلاعات سفارش'),
                        SizedBox(height: vertical_distance),

                        // Select Packing if available
                        productSingleData.packList!.length > 0
                            ? DropdownButton<String>(
                          hint: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'بسته بندی',
                            ),
                          ),
                          items: productSingleData.packList!
                              .map<DropdownMenuItem<String>>(
                                  (PackList object) {
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
                        )
                            : SizedBox(),

                        // Select Packing if available
                        productSingleData.itemId!.propertyList!.length > 0 &&
                            productSingleData
                                .itemId!.propertyList![0].calculating ==
                                true
                            ? DropdownButton<String>(
                          hint: Opacity(
                            opacity: 0.5,
                            child: Text(productSingleData
                                .itemId!.propertyList![0].nameFa!),
                          ),
                          items: productSingleData
                              .itemId!.propertyList![0].selectList!
                              .map<DropdownMenuItem<String>>(
                                  (String object) {
                                return DropdownMenuItem<String>(
                                  value: object,
                                  child: Text(object.toString()),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        )
                            : SizedBox(),

                        TextField(
                          onChanged: (input) {
                            processingRequestModel.orderList![0].number =
                                int.parse(input);
                          },
                        )
                      ],
                    ),
                  ),

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

  void addToCart() {}
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
  }
}
