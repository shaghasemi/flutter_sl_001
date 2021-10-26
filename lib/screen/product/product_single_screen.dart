import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
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
  GlobalKey<FormState> _formKeyProductSingle = GlobalKey<FormState>();

  ApiServiceProduct apiServiceProduct = ApiServiceProduct();
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();

  TextEditingController textControllerProvince = TextEditingController();
  TextEditingController textControllerCity = TextEditingController();
  TextEditingController textControllerAddress = TextEditingController();

  late ProductSingleRequestModel productSingleRequestModel;

  int latestPrice = 0;

  late ProcessingRequestModel processingRequestModel;
  late ProcessingRequestOrderList processingRequestOrderList;
  late ProcessingRequestSelectedPropertyIdList
      processingRequestSelectedPropertyIdList;

  ProductSingleData productSingleData = ProductSingleData();
  ProcessingResponseData processingData = ProcessingResponseData();

  int price = 0;
  int ratioUnit = 1;
  order_options case_property = order_options.blank;
  double vertical_distance = 20.0;

  var dropDownPacking;
  var dropDownCalculating;

  TextEditingController provinceController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    productSingleRequestModel =
        ProductSingleRequestModel(id: widget.product_id);
    processingRequestModel = ProcessingRequestModel(
      orderList: [
        ProcessingRequestOrderList(
          // selectedPropertyIdList: [],
          selectedPropertyIdList: null,
          id: widget.product_id,
          lat: 29.5,
          lon: 52.9,
          address: 'a',
          city: 's',
          province: 'd',
          number: 10,
          packId: '61654ab2e311de6928b890b3',
        ),
      ],
    );
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
                  Form(
                    key: _formKeyProductSingle,
                    child: Column(
                      children: [
                        Text('اطلاعات موقعیتی'),

                        // Get Province
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'استان',
                            labelText: 'استان',
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "الزامی";
                            }
                            if (val.length < 2) {
                              return "نام استان حداقل دو حرف می باشد.";
                            }
                          },
                          keyboardType: TextInputType.streetAddress,
                          onChanged: (input) {
                            processingRequestModel.orderList[0].province =
                                input;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'شهر',
                            labelText: 'شهر',
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "الزامی";
                            }
                            if (val.length < 2) {
                              return "نام شهر حداقل دو حرف می باشد.";
                            }
                          },
                          keyboardType: TextInputType.streetAddress,
                          onChanged: (input) {
                            processingRequestModel.orderList[0].city = input;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'نشانی',
                            labelText: 'نشانی',
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "الزامی";
                            }
                            if (val.length < 12) {
                              return "نشانی حداقل دوازده حرف می باشد.";
                            }
                          },
                          keyboardType: TextInputType.streetAddress,
                          onChanged: (input) {
                            processingRequestModel.orderList[0].address = input;
                          },
                        )
                      ],
                    ),
                  ),
                  // Card(),

                  Text(productSingleData.titleFa!),
                  SizedBox(height: vertical_distance),

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKeyProductSingle.currentState!.validate()) {
                        print("Form Valid");
                        getPrice();
                        return Provider.of<CartProductList>(context,
                                listen: false)
                            .addProductToCart(
                          // id: productInfo.id.toString(),
                          id: productSingleData.id!,
                        );
                      }
                      /*getPrice();
                      return Provider.of<CartProductList>(context,
                              listen: false)
                          .addProductToCart(
                        // id: productInfo.id.toString(),
                        id: productSingleData.id!,
                      );*/
                    },
                    child: Text("افزودن به سبد خرید"),
                  ),
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
              value: dropDownPacking,
              hint: Opacity(
                opacity: 0.5,
                child: Text(
                  'بسته بندی',
                ),
              ),
              items: productSingleData.packList!.map((object) {
                return DropdownMenuItem(
                  value: object.id,
                  child: Text(object.name!),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  dropDownPacking = newValue!;
                  processingRequestModel.orderList[0].packId = newValue;
                  getPrice();
                  // getPrice();
                });
              },
            ),

          // Select Calculating Property if available
          if (case_property == order_options.number_calculating ||
              case_property == order_options.number_calculating_packing)
            DropdownButton<String>(
              value: dropDownCalculating,
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
                getPrice();
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
              processingRequestModel.orderList[0].number = int.parse(input);
              getPrice();
              /*setState(() {
                getPrice();
              });*/
// processingRequestModel.orderList![0].number = int.parse(input);
            },
          ),
          // Maybe this could show the price
          // It could use provider (it might help with next steps to add to cart
          Text('Price Updating'),
          Text(latestPrice.toString()),
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

  void getPrice() {
    apiServiceOrder.processing(processingRequestModel).then((value) {
      // latestPrice = value.data![0].calculated!.total!;
      setState(() {
        latestPrice = value.data![0].calculated!.total!;
      });
    });
  }

  void addToCart() {}

  @override
  void dispose() {
    textControllerProvince.dispose();
    textControllerCity.dispose();
    textControllerAddress.dispose();
    super.dispose();
  }
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
  }
}
