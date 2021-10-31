import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model_old_new.dart';
import 'package:flutter_sl_001/model/product/product_single_model_old.dart';
import 'package:flutter_sl_001/provider_test/cart_provider.dart';
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
  GlobalKey<FormState> _formKeyOrderOption = GlobalKey<FormState>();

  ApiServiceProduct apiServiceProduct = ApiServiceProduct();
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();

  TextEditingController textControllerProvince = TextEditingController();
  TextEditingController textControllerCity = TextEditingController();
  TextEditingController textControllerAddress = TextEditingController();

  late ProductSingleRequestModel productSingleRequestModel;

  // ProcessingResponseData orderData = ProcessingResponseData();

  late ProcessingRequestModel processingRequestModel;
  late ProcessingRequestOrderList processingRequestOrderList;
  late ProcessingRequestSelectedPropertyIdList
      processingRequestSelectedPropertyIdList;

  int latestPrice = 0;
  ProductSingleData productSingleData = ProductSingleData();
  ProcessingResponseData processingData = ProcessingResponseData();
  PropertyListProduct productProperty = PropertyListProduct();

  PropertyList? calculatingProperty = PropertyList(id: '');

  int calculatingCode = 0;
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
          // selectedPropertyIdList: null,
          id: widget.product_id,
          lat: 29.5,
          lon: 52.9,
        ),
      ],
    );
    processingRequestModel.orderList[0].selectedPropertyIdList = [
      ProcessingRequestSelectedPropertyIdList()
    ];
  }

  Widget build(BuildContext context) {
    Future<ProductSingleData> getSingleProductData() =>
        apiServiceProduct.productSingleData(productSingleRequestModel);

    return FutureBuilder(
      future: getSingleProductData(),
      builder: (context, snapshot) {
        print("Fault 1");
        if (snapshot.hasData) {
          print("Fault 2");
          productSingleData =
              ProductSingleData.fromJson(jsonDecode(jsonEncode(snapshot.data)));

          // Get the code for calculating proper if available
          calculatingCode = productSingleData.item_id!.property_list!
                  .firstWhere((element) => element.calculating == true,
                      orElse: () => PropertyList())
                  .code ??
              0;
          // Get a separate variable for calculating property
          if (calculatingCode != 0) {
            calculatingProperty = productSingleData.item_id!.property_list!
                .where((element) => element.code == calculatingCode)
                .first;
            productProperty = productSingleData.property_list!.firstWhere(
                (element) => element.code == calculatingCode,
                orElse: () => PropertyListProduct());
            // Set id for the calculating property in the processing request
            processingRequestModel.orderList[0].selectedPropertyIdList![0]
                .propertyId = productProperty.id;
          }

          if (productSingleData.pack_list!.length == 0) {
            if (calculatingCode == 0) {
              case_property = order_options.number;
            } else {
              case_property = order_options.number_calculating;
            }
          } else {
            if (calculatingCode == 0) {
              case_property = order_options.number_packing;
            } else {
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
                  Text(productSingleData.title_fa!),
                  SizedBox(height: vertical_distance),

                  // Product Code
                  Text(
                    'کد محصول: ${productSingleData.tracking_code!}',
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
                                input.trim();
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
                            processingRequestModel.orderList[0].city =
                                input.trim();
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
                            processingRequestModel.orderList[0].address =
                                input.trim();
                          },
                        )
                      ],
                    ),
                  ),
                  // Card(),

                  Text(productSingleData.title_fa!),
                  SizedBox(height: vertical_distance),

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKeyProductSingle.currentState!.validate()) {
                        if (_formKeyOrderOption.currentState!.validate()) {
                          // getPrice();
                          addToCart();
                        }
                      }
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
      height: 200,
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
      child: Form(
        key: _formKeyOrderOption,
        child: Column(
          children: [
            Text('اطلاعات سفارش'),
            SizedBox(height: vertical_distance),

            // Select Packing if available
            if (case_property == order_options.number_packing ||
                case_property == order_options.number_calculating_packing)
              DropdownButtonFormField<String>(
                elevation: 2,
                validator: (val) {
                  if (case_property == order_options.number_packing ||
                      case_property ==
                          order_options.number_calculating_packing) {
                    print("Packing Val: $val");
                    if (val!.length == 0) {
                      return "الزامی";
                    }
                  }
                },
                value: dropDownPacking,
                hint: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'بسته بندی',
                  ),
                ),
                items: productSingleData.pack_list!.map((object) {
                  return DropdownMenuItem(
                    value: object.id,
                    child: Text(object.name!),
                  );
                }).toList(),
                onChanged: (newValue) {
                  dropDownPacking = newValue!;
                  processingRequestModel.orderList[0].packId = newValue;
                  getPrice();
                },
              ),

            // Select Calculating Property if available
            if (case_property == order_options.number_calculating ||
                case_property == order_options.number_calculating_packing)
              DropdownButtonFormField<String>(
                elevation: 2,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 16),
                // isDense: true,
                iconSize: 30.0,
                // iconEnabledColor: Colors.white,
                value: dropDownCalculating,
                validator: (val) {
                  if (case_property == order_options.number_calculating ||
                      case_property ==
                          order_options.number_calculating_packing) {
                    print("Calc Val: $val");
                    if (val!.length == 0) {
                      return "الزامی";
                    }
                  }
                },
                hint: Opacity(
                  opacity: 0.5,
                  child: Text(calculatingProperty!.name_fa!),
                ),
                items: productProperty.select_ratio_list!
                    .map<DropdownMenuItem<String>>((SelectRatio object) {
                  return DropdownMenuItem<String>(
                    value: object.id,
                    child: Text(object.name!),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  dropDownCalculating = newValue;
                  getPrice();
                  processingRequestModel.orderList[0].selectedPropertyIdList![0]
                      .partId = newValue;
                  processingRequestModel.orderList[0].selectedPropertyIdList![0]
                          .propertyName =
                      productProperty.select_ratio_list!
                          .firstWhere((element) => element.id == newValue)
                          .name;
                },
              ),

            // Available in all cases - Order Quantity
            TextFormField(
              validator: (val) {
                if (val!.length == 0) {
                  return "تعداد سفارش را وارد کنید.";
                }
              },
              decoration: InputDecoration(hintText: 'تعداد'),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                processingRequestModel.orderList[0].number = int.parse(input);
                getPrice();
              },
            ),
            Text('قیمت نهایی'),
            Text(latestPrice.toString()),
          ],
        ),
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
          itemCount: productSingleData.price_ratio_range_list!.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text('از '),
                Text(productSingleData.price_ratio_range_list![index].start
                    .toString()),
                Text(' تا '),
                Text(productSingleData.price_ratio_range_list![index].end
                    .toString()),
                Text(productSingleData.unit.toString()),
                Text(productSingleData
                    .price_ratio_range_list![index].ratio_price
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
            Text(productSingleData.min_order.toString()),
          ],
        ),
        Row(
          children: [
            Text('حداکثر سفارش: '),
            Text(productSingleData.max_order.toString()),
          ],
        ),
      ],
    );
  }

  void getPrice() {
    apiServiceOrder.processing(processingRequestModel).then((value) {
      setState(() {
        latestPrice = value.data![0].calculated!.total!;
        processingData = value.data![0];
      });
    });
  }

  void addToCart() {
    if (order_options.number_calculating == true) {
      print("Fill required");
    } else {
      apiServiceOrder.processing(processingRequestModel).then(
        (value) {
          Provider.of<CartProvider>(context, listen: false)
              .addOrderToCart(value.data![0]);
        },
      );
    }
  }

  @override
  void dispose() {
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
