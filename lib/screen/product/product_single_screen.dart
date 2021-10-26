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
  ApiServiceProduct apiServiceProduct = ApiServiceProduct();
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();

  TextEditingController textControllerQuantity = TextEditingController();
  TextEditingController textControllerProvince = TextEditingController();
  TextEditingController textControllerCity = TextEditingController();
  TextEditingController textControllerAddress = TextEditingController();

  late ProductSingleRequestModel productSingleRequestModel;
  late ProcessingRequestModel processingRequestModel;

  // late ProcessingRequestModel myProcessingList;
  late ProcessingRequestOrderList processingRequestOrderList;

  ProductSingleData productSingleData = ProductSingleData();
  ProcessingResponseData processingData = ProcessingResponseData();
  late List<ProcessingRequestOrderList> myProcessingList;

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
    myProcessingList = [ProcessingRequestOrderList(id: '')];
    processingRequestModel =
        ProcessingRequestModel(orderList: myProcessingList);
    // processingRequestModel = List<ProcessingRequestOrderList>;
    processingRequestOrderList = ProcessingRequestOrderList(
      id: widget.product_id,
      // These will change later and derive from map
      lat: 29.597526011584144,
      lon: 52.51078605651856,
    );
    // myProcessingList = [ProcessingRequestOrderList(id: '')];
    myProcessingList[0] = ProcessingRequestOrderList(
      id: widget.product_id,
      lat: 29.597526011584144,
      lon: 52.51078605651856,
      address: '',
      city: '',
      province: '',
      number: 12,
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
                  Column(
                    children: [
                      Text('اطلاعات موقعیتی'),
                      TextField(
                        decoration: InputDecoration(hintText: 'تعداد'),
                        keyboardType: TextInputType.number,
                        onChanged: (input) {
                          processingRequestModel.orderList![0].number =
                              int.parse(input);
                        },
                      ),
                      TextInputProductScreen(
                          hint: 'استان',
                          customController: textControllerProvince,
                          receptor: processingRequestOrderList.province,
                          // receptor: processingRequestOrderList.id,
                          keyboardType: TextInputType.streetAddress,
                          label: 'استان'),
                    ],
                  ),
                  // Card(),

                  Text(productSingleData.titleFa!),
                  SizedBox(height: vertical_distance),

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      addToCart();
                      return Provider.of<CartProductList>(context,
                              listen: false)
                          .addProductToCart(
                        // id: productInfo.id.toString(),
                        id: productSingleData.id!,
                      );
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

  TextFormField TextInputProductScreen(
      {required String hint,
      String? label,
      receptor,
      keyboardType,
      customController}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      keyboardType: keyboardType,
      controller: customController,

      /*onChanged: (input) {
        receptor = input;
        processingRequestOrderList.city = input;
      },*/
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
                  myProcessingList[0].packId = newValue;
                  print("newValue Packing:");
                  print(newValue);
                  getPrice();
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
    print("processingRequestOrderList.city");
    print(textControllerProvince.text);
    processingRequestModel.orderList = myProcessingList;
    print("processingRequestModel:");
    print(processingRequestModel);
    apiServiceOrder.processing(processingRequestModel).then((value) {
      print(value.message);
      return value.status;
    });
  }

  FutureBuilder getPrice() {
    print('Get Price Called!');
    // print(myProcessingList);
    processingRequestModel.orderList = myProcessingList;
    // print(processingRequestModel);
    Future<ProcessingResponseModel> getProcessingData() =>
        // apiServiceOrder.processing(myProcessingList);
        apiServiceOrder.processing(processingRequestModel);
    return FutureBuilder(
      future: getProcessingData(),
      builder: (context, snapshot) {
        print("before data");
        if (snapshot.hasData) {
          print("has data");
          processingData = ProcessingResponseData.fromJson(
              jsonDecode(jsonEncode(snapshot.data)));
        }
        print("processingData.calculated!.price.toString()");
        print(processingData.calculated!.price.toString());
        return Text(processingData.calculated!.price.toString());
      },
    );
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
