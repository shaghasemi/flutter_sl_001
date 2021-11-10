import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/data/provider/cart_provider.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/src/extensions.dart';
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
  TextEditingController _textControllerQuantity =
      TextEditingController(text: '1');

  late ProductSingleRequestModel productSingleRequestModel;

  // ProcessingResponseData orderData = ProcessingResponseData();

  late ProcessingRequestModel processingRequestModel;
  late ProcessingRequestOrderList processingRequestOrderList;
  late ProcessingRequestSelectedPropertyIdList
      processingRequestSelectedPropertyIdList;

  bool _pack_is_selected = false;
  bool _calc_is_selected = false;
  int selected_pack = 0;
  int selected_calc = 0;
  int allowed_quantity = 0;

  int min_order_temp = 0;
  int min_order_calc = 0;
  int max_order_calc = 0;
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
        if (snapshot.hasData) {
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

          return Scaffold(
            body: NestedScrollView(
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
                child: Padding(
                  // padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Slider
                      ImageSliderProduct(context),
                      Divider(
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      SizedBox(height: vertical_distance),

                      // TODO: Categories To be implemented in future
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(productSingleData.category_id_list![1]),
                          Text('/'),
                          Text(productSingleData.category_id_list![2]),
                        ],
                      ),*/

                      // Product Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          productSingleData.title_fa!,
                          softWrap: true,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: vertical_distance / 4),

                      // Seller
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.storefront,
                              color: Colors.green,
                              size: 20,
                            ),
                            Text(
                              ' فروشنده: ${productSingleData.branch_id!.name!}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: vertical_distance / 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              // Icons.paid,
                              color: Colors.green,
                              size: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  ' قیمت هر ',
                                  // productSingleData.title_fa!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontFamily: 'Vazir',
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  productSingleData.unit!,
                                  // productSingleData.title_fa!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontFamily: 'Vazir',
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ': ',
                                  // productSingleData.title_fa!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontFamily: 'Vazir',
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  productSingleData.price
                                      .toString()
                                      .toPersianDigit()
                                      .seRagham(),
                                  // productSingleData.title_fa!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontFamily: 'Vazir',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' ریال',
                                  // productSingleData.title_fa!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontFamily: 'Vazir',
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Price per Item

                      SizedBox(height: vertical_distance),

                      MinMaxOrder(),
                      SizedBox(height: vertical_distance),

                      // Discount based on order quantity
                      DiscountConditional(),
                      SizedBox(height: vertical_distance),

                      // Order Options
                      OrderOptions(case_property),
                      SizedBox(height: vertical_distance),

                      // Geographical Information
                      GeographicalOptions(context),
                      // Card(),

                      // Floating
                      SizedBox(height: vertical_distance * 4),

                      // Add to Cart Button
                      /*ElevatedButton(
                        onPressed: () {
                          if (_formKeyProductSingle.currentState!.validate()) {
                            if (_formKeyOrderOption.currentState!.validate()) {
                              // getPrice();
                              addToCart();
                            }
                          }
                        },
                        child: Text("افزودن به سبد خرید"),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 2.8,
                          color: Theme.of(context).primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKeyProductSingle.currentState!.validate()) {
                          if (_formKeyOrderOption.currentState!.validate()) {
                            // getPrice();
                            addToCart();
                          } else {
                            return null;
                            // setState(() {_autoVa});
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "افزودن به سبد خرید",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  // Text('Price'),
                  // Text('قیمت نهایی'),
                  Text(
                    '${(latestPrice.toString()).toPersianDigit().seRagham()} ریال',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            /*floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton.extended(
              label: Text("افزودن به سبد خرید"),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              isExtended: true,
              onPressed: () {
                if (_formKeyProductSingle.currentState!.validate()) {
                  if (_formKeyOrderOption.currentState!.validate()) {
                    // getPrice();
                    addToCart();
                  }
                }
              },
            ),*/
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

  ImageSliderProduct(BuildContext context) {
    return Container(
      height: 300,
      // color: Colors.grey.shade400,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
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
      ),
    );
  }

  MinMaxOrder() {
    if (_pack_is_selected) {
      if (_calc_is_selected) {
        if ((productSingleData.property_list![0]
                    .select_ratio_list![selected_calc].inventory! <
                int.parse(
                    productSingleData.pack_list![selected_pack].ratio_unit!)) ||
            productSingleData.property_list![0]
                    .select_ratio_list![selected_calc].inventory! <
                productSingleData.min_order!) {
          min_order_calc = 0;
        } else {
          min_order_temp = (productSingleData.min_order! /
                  int.parse(
                      productSingleData.pack_list![selected_pack].ratio_unit!))
              .floor();
          if (min_order_temp < 1) {
            min_order_calc = 1;
          } else {
            min_order_calc = min_order_temp;
          }
        }
        if (productSingleData.property_list![0]
                .select_ratio_list![selected_calc].inventory! <
            int.parse(
                productSingleData.pack_list![selected_pack].ratio_unit!)) {
          max_order_calc = 0;
        } else if (productSingleData.property_list![0]
                .select_ratio_list![selected_calc].inventory! <
            productSingleData.max_order!) {
          max_order_calc = (productSingleData.inventory! /
                  int.parse(
                      productSingleData.pack_list![selected_pack].ratio_unit!))
              .floor();
        } else {
          max_order_calc = (productSingleData.max_order! /
                  int.parse(
                      productSingleData.pack_list![selected_pack].ratio_unit!))
              .floor();
        }
      } else {
        if ((productSingleData.inventory! <
                int.parse(
                    productSingleData.pack_list![selected_pack].ratio_unit!)) ||
            productSingleData.inventory! < productSingleData.min_order!) {
          min_order_calc = 0;
        } else {
          min_order_temp = (productSingleData.min_order! /
                  int.parse(
                      productSingleData.pack_list![selected_pack].ratio_unit!))
              .floor();
          if (min_order_temp < 1) {
            min_order_calc = 1;
          } else {
            min_order_calc = min_order_temp;
          }
        }
        if (productSingleData.inventory! <
            int.parse(
                productSingleData.pack_list![selected_pack].ratio_unit!)) {
          max_order_calc = 0;
        } else if (productSingleData.inventory! <
            productSingleData.max_order!) {
          max_order_calc = (productSingleData.inventory! /
                  int.parse(
                      productSingleData.pack_list![selected_pack].ratio_unit!))
              .floor();
        } else {
          max_order_calc = (productSingleData.max_order! /
                  int.parse(
                      productSingleData.pack_list![selected_pack].ratio_unit!))
              .floor();
        }
      }
    } else if (_calc_is_selected) {
      if (productSingleData
              .property_list![0].select_ratio_list![selected_calc].inventory! <
          productSingleData.min_order!) {
        min_order_calc = 0;
      } else {
        min_order_temp = (productSingleData.min_order!);
        if (min_order_temp < 1) {
          min_order_calc = 1;
        } else {
          min_order_calc = min_order_temp;
        }
      }
      if (productSingleData
              .property_list![0].select_ratio_list![selected_calc].inventory! <
          productSingleData.max_order!) {
        max_order_calc = (productSingleData.inventory!);
      } else {
        max_order_calc = productSingleData.max_order!;
      }
    } else {
      min_order_calc = productSingleData.min_order!;
      max_order_calc = productSingleData.max_order!;
    }

    print("MinMax 1:");
    print(min_order_calc);
    print(max_order_calc);
    print(productSingleData.property_list![0].select_ratio_list![selected_calc]
        .toString());
    print("MinMax 2:");
    print(_pack_is_selected);
    print(selected_pack);
    print(_calc_is_selected);
    print(selected_calc);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  Icons.inventory,
                  color: Colors.green,
                  size: 20,
                ),
                Text(' موجودی: '),
                _calc_is_selected
                    ? Text(productSingleData.property_list![0]
                        .select_ratio_list![selected_calc].inventory
                        .toString()
                        .toPersianDigit())
                    : Text(productSingleData.inventory!
                        .toString()
                        .toPersianDigit()),
                Text(' '),
                Text(productSingleData.unit!),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.expand_less,
                  color: Colors.green,
                  size: 20,
                ),
                Text(' حداقل سفارش: '),
                Text(min_order_calc.toString()),
                Text(' '),
                Text(_pack_is_selected
                    ? productSingleData.pack_list![selected_pack].name!
                    : productSingleData.unit!),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.expand_more,
                  color: Colors.green,
                  size: 20,
                ),
                Text(' حداکثر سفارش: '),
                Text(max_order_calc.toString()),
                Text(' '),
                Text(_pack_is_selected
                    ? productSingleData.pack_list![selected_pack].name!
                    : productSingleData.unit!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DiscountConditional() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text('درصد تخفیف به ازای تعداد سفارش'),
            Text(
              'تخفیف ویژه ی سفارش',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: vertical_distance),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productSingleData.price_ratio_range_list!.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('از '),
                        Text(
                          productSingleData.price_ratio_range_list![index].start
                              .toString()
                              .toPersianDigit(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(' تا '),
                        Text(
                          productSingleData.price_ratio_range_list![index].end
                              .toString()
                              .toPersianDigit(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(' '),
                        Text(productSingleData.unit.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          productSingleData
                              .price_ratio_range_list![index].ratio_price
                              .toString()
                              .toPersianDigit(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(' درصد'),
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  OrderOptions(case_property) {
    return Card(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKeyOrderOption,
          // Auto validation causes null issue
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Text(
                'اطلاعات سفارش',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: vertical_distance),

              // Select Packing if available
              if (case_property == order_options.number_packing ||
                  case_property == order_options.number_calculating_packing)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                      // prefixIcon: Icon(Icons.local_post_office),
                      label: Text('بسته بندی'),
                      alignLabelWithHint: true,
                    ),
                    elevation: 2,
                    validator: (val) {
                      if (val != null) {
                        if (val.length == 0) {
                          return "بسته بندی انتخاب شود.";
                        } else {
                          // return null;
                        }
                      } else {
                        // return null;
                      }

                      /*if (case_property == order_options.number_packing ||
                          case_property ==
                              order_options.number_calculating_packing) {
                        if (val!.length == 0) {
                          return "بسته بندی انتخاب شود.";
                        } else {
                          return null;
                        }
                      }*/
                    },
                    value: dropDownPacking,
                    items: productSingleData.pack_list!.map((object) {
                      return DropdownMenuItem(
                        value: object.id,
                        child: Text(object.name!),
                      );
                    }).toList(),
                    iconSize: 30.0,
                    onChanged: (newValue) {
                      dropDownPacking = newValue!;
                      processingRequestModel.orderList[0].packId = newValue;
                      print(
                          "Print 3: ${jsonEncode(processingRequestModel.orderList)}");
                      getPrice();
                      setState(() {
                        selected_pack = productSingleData.pack_list!
                            .indexWhere((element) => element.id == newValue);
                        _pack_is_selected = true;
                      });
                    },
                  ),
                ),

              // Select Calculating Property if available
              if (case_property == order_options.number_calculating ||
                  case_property == order_options.number_calculating_packing)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: DropdownButtonFormField<String>(
                    elevation: 2,
                    decoration: InputDecoration(
                      label: Text(calculatingProperty!.name_fa!),
                      alignLabelWithHint: true,
                      /*enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),*/
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
                        if (val!.length == 0) {
                          return "الزامی";
                        }
                      }
                    },
                    items: productProperty.select_ratio_list!
                        .map<DropdownMenuItem<String>>((SelectRatio object) {
                      return DropdownMenuItem<String>(
                        value: object.id,
                        child: Text(object.name!),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      dropDownCalculating = newValue;
                      processingRequestModel.orderList[0]
                          .selectedPropertyIdList![0].partId = newValue;
                      processingRequestModel.orderList[0]
                              .selectedPropertyIdList![0].propertyId =
                          productProperty.select_ratio_list!
                              .firstWhere((element) => element.id == newValue)
                              .id;
                      processingRequestModel.orderList[0]
                              .selectedPropertyIdList![0].propertyName =
                          productSingleData.item_id!.property_list![0].name_fa;
                      print(
                          "Print 4: ${jsonEncode(processingRequestModel.orderList)}");
                      getPrice();
                      setState(() {
                        _calc_is_selected = true;
                        selected_calc = productProperty.select_ratio_list!
                            .indexWhere((element) => element.id == newValue);
                      });
                    },
                  ),
                ),
              SizedBox(
                height: vertical_distance,
              ),

              // Available in all cases - Order Quantity
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _pack_is_selected
                        ? Text(
                            'تعداد بر حسب ${productSingleData.pack_list![selected_pack].name!}: ',
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            'تعداد بر حسب ${productSingleData.unit!}: ',
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                    Container(
                      // height: 60,
                      // width: 120.0,
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                // key: _inputQuantityKey,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                validator: (val) {
                                  if (productSingleData
                                          .property_list![0]
                                          .select_ratio_list![selected_calc]
                                          .inventory! ==
                                      0) {
                                    return 'کالا با ویژگی های مورد نظر موجودی ندارد.';
                                  } else if (int.parse(val!) >
                                      productSingleData
                                          .property_list![0]
                                          .select_ratio_list![selected_calc]
                                          .inventory!) {
                                    return 'تعداد مورد نظر موجود نیست.';
                                  } else {
                                    if (int.parse(val) < min_order_calc) {
                                      return 'سفارش از حداقل مجاز کمتر است';
                                    } else if (int.parse(val) >
                                        max_order_calc) {
                                      return 'سفارش از حداکثر مجاز بیشتر است';
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                                decoration: InputDecoration(
                                  /*contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8),*/
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                controller: _textControllerQuantity,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: false,
                                  signed: true,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (input) {
                                  print(
                                      "Print 5: ${jsonEncode(processingRequestModel.orderList)}");
                                  getPrice();
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_drop_up),
                                      iconSize: 18,
                                      onPressed: () {
                                        int currentValue = int.parse(
                                            _textControllerQuantity.text);
                                        setState(
                                          () {
                                            currentValue++;
                                            _textControllerQuantity.text =
                                                currentValue.toString();
                                            getPrice();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 18,
                                      onPressed: () {
                                        int currentValue = int.parse(
                                            _textControllerQuantity.text);
                                        setState(
                                          () {
                                            print("Setting state");
                                            currentValue--;
                                            _textControllerQuantity.text =
                                                (currentValue > 0
                                                        ? currentValue
                                                        : 0)
                                                    .toString();
                                            getPrice();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GeographicalOptions(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Form(
          key: _formKeyProductSingle,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'اطلاعات موقعیتی',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: Text('استان'),
                          // prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.all(12),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
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
                    ),
                  ),
                  // const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: Text('شهر'),
                          // prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.all(12),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                // width: MediaQuery.of(context).size.width * .87,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text('نشانی محل تحویل'),
                    // prefixIcon: Icon(Icons.phone),
                    contentPadding: EdgeInsets.all(12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "الزامی";
                    }
                    if (val.length < 12) {
                      return "نشانی حداقل دوازده حرف می باشد.";
                    }
                  },
                  // keyboardType: TextInputType.streetAddress,
                  onChanged: (input) {
                    processingRequestModel.orderList[0].address = input.trim();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPrice() {
    if (_formKeyOrderOption.currentState!.validate()) {
// The issue with double and int still exists.
      // When double values come in, things stop working
      //TODO: FIx int and double issue
      print("Print 1: ${_textControllerQuantity.text}");
      processingRequestModel.orderList[0].number =
          int.parse(_textControllerQuantity.text);
      print("Print 2: ${jsonEncode(processingRequestModel.orderList)}");
      apiServiceOrder.processing(processingRequestModel).then((value) {
        setState(() {
          latestPrice = value.data![0].calculated!.total!;
          processingData = value.data![0];
        });
      });
    } else {
      return null;
    }
  }

  void addToCart() {
    // print("Product 3: ${jsonEncode(processingRequestModel)}");
    apiServiceOrder.processing(processingRequestModel).then(
      (value) {
        Provider.of<CartProvider>(context, listen: false)
            .addOrderToCart(value.data![0]);
        // dispose();
      },
    );
    /* if (order_options.number_calculating == true) {
      print("Fill required");
    } else {
      apiServiceOrder.processing(processingRequestModel).then(
        (value) {
          Provider.of<CartProvider>(context, listen: false)
              .addOrderToCart(value.data![0]);
        },
      );
    }*/
  }

  @override
  void dispose() {
    textControllerCity.dispose();
    textControllerProvince.dispose();
    textControllerAddress.dispose();
    _textControllerQuantity.dispose();
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
