import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/cart_provider.dart';
import 'package:flutter_sl_001/model/order/register_list_model.dart';
import 'package:flutter_sl_001/screen/cart/widget/order_item_confirm_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ConfirmOrderScreen extends StatefulWidget {
  // RegisterListRequestModel registerListRequestModel;
  Customer_info customerInfo;
  String token = '';

  ConfirmOrderScreen(
      {Key? key, required this.customerInfo, required this.token})
      : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();
  late RegisterListRequestModel registerListRequestModel;
  String? token = UserPreferences.userPrefs.getString('token');

  @override
  void initState() {
    super.initState();
    registerListRequestModel = RegisterListRequestModel(
      // token: token,
      customerInfo: widget.customerInfo,
      // orderList: [Order_list()],
      orderList: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    registerListRequestModel.token = token;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: const Text(
              "پرداخت",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
            actions: [
              TextButton(
                style: ButtonStyle(
                    // elevation: 4,
                    ),
                onPressed: () {
                  registerListRequestModel.token = token;
                  print(
                      "Print Cart 11: ${jsonEncode(registerListRequestModel.orderList)}");
                  print(
                      "Print Cart 12: ${jsonEncode(registerListRequestModel.token)}");
                   print(
                      "Print Cart 13: ${jsonEncode(registerListRequestModel.customerInfo)}");
                  print("Print Cart 2 token: ${token}"); // String tokenCustom =
                  print("Print Cart 3 token: ${widget.token}"); // String tokenCustom =
                  // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlX2lkIjoiNjE2Mjk4MzdlMzExZGU2OTI4YjgyOTNmIiwibW9iaWxlIjoiMDkxNzEyNDU0MDIiLCJpcCI6Ijo6ZmZmZjoxOTIuMTY4LjE2OC4xODUiLCJ0eXBlIjoiY3VzdG9tZXIiLCJpYXQiOjE2MzU2NjA1MjQsImV4cCI6MTYzNjI2NTMyNH0.x6p0skHvLvKhqFM51grrcOHFy7nNm1e04OYYaZAbA_E";
                  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlX2lkIjoiNjE2Mjk4MzdlMzExZGU2OTI4YjgyOTNmIiwibW9iaWxlIjoiMDkxNzEyNDU0MDIiLCJpcCI6Ijo6ZmZmZjoxOTIuMTY4LjE2OC4xODUiLCJ0eXBlIjoiY3VzdG9tZXIiLCJpYXQiOjE2MzU2NjA5ODcsImV4cCI6MTYzNjI2NTc4N30.b59L1ZG6uMYCG6t3ynpqRWW9BTDpizl4Zlw5l8Q3fn4;
                  apiServiceOrder
                      .registerListOrder(registerListRequestModel)
                      .then((value) {
                    CartProvider().clearCart();
                    Fluttertoast.showToast(
                      msg: value.message.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      // fontSize: 16.0,
                    );
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );*/
                  }).onError(
                    (error, stackTrace) {
                      Fluttertoast.showToast(
                        msg: error.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        // fontSize: 16.0,
                      );
                    },
                  ).whenComplete(
                    () {
                      /*setState(
                            () {
                          _isApiCallProcess = false;
                        },
                      );*/
                    },
                  );
                  ;
                },
                child: Text(
                  "تایید اطلاعات",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<CartProvider>(
                  builder: (context, value, child) {
                    // registerListRequestModel.orderList=[]
                    for (int i = 0; i < value.processingList.length; i++) {
                      Order_list newOrderList = Order_list();
                      newOrderList.id = value.processingList[i].order!.id;
                      newOrderList.packId =
                          value.processingList[i].order!.packId;
                      newOrderList.isPack =
                          newOrderList.packId != null ? true : false;
                      newOrderList.number =
                          value.processingList[i].order!.number;
                      newOrderList.address =
                          value.processingList[i].order!.address;
                      newOrderList.lat = value.processingList[i].order!.lat;
                      newOrderList.lon = value.processingList[i].order!.lon;
                      newOrderList.province =
                          value.processingList[i].order!.province;
                      newOrderList.city = value.processingList[i].order!.city;
                      if (value.processingList[i].order!
                                  .selectedPropertyIdList !=
                              null ||
                          value.processingList[i].order!
                                  .selectedPropertyIdList !=
                              []) {
                        newOrderList.selectedPropertyIdList = [
                          Selected_property_id_list()
                        ];
                        newOrderList.selectedPropertyIdList![0].partId = value
                            .processingList[i]
                            .order!
                            .selectedPropertyIdList![0]
                            .partId;
                        newOrderList.selectedPropertyIdList![0].propertyId =
                            value.processingList[i].order!
                                .selectedPropertyIdList![0].propertyId;
                        newOrderList.selectedPropertyIdList![0].propertyName =
                            value.processingList[i].order!
                                .selectedPropertyIdList![0].propertyName;
                      }
                      /*registerListRequestModel.orderList![i].id =
                          value.processingList[i].order!.id;
                      registerListRequestModel.orderList![i].packId =
                          value.processingList[i].order!.packId;
                      registerListRequestModel.orderList![i].isPack =
                          registerListRequestModel.orderList![i].packId != null
                              ? true
                              : false;
                      registerListRequestModel.orderList![i].number =
                          value.processingList[i].order!.number;
                      registerListRequestModel.orderList![i].address =
                          value.processingList[i].order!.address;
                      registerListRequestModel.orderList![i].lat =
                          value.processingList[i].order!.lat;
                      registerListRequestModel.orderList![i].lon =
                          value.processingList[i].order!.lon;
                      registerListRequestModel.orderList![i].province =
                          value.processingList[i].order!.province;
                      registerListRequestModel.orderList![i].city =
                          value.processingList[i].order!.city;
                      if (value.processingList[i].order!
                                  .selectedPropertyIdList !=
                              null ||
                          value.processingList[i].order!
                                  .selectedPropertyIdList !=
                              []) {
                        registerListRequestModel
                            .orderList![i].selectedPropertyIdList = [
                          Selected_property_id_list()
                        ];
                        registerListRequestModel.orderList![i]
                                .selectedPropertyIdList![0].partId =
                            value.processingList[i].order!
                                .selectedPropertyIdList![0].partId;
                        registerListRequestModel.orderList![i]
                                .selectedPropertyIdList![0].propertyId =
                            value.processingList[i].order!
                                .selectedPropertyIdList![0].propertyId;
                        registerListRequestModel.orderList![i]
                                .selectedPropertyIdList![0].propertyName =
                            value.processingList[i].order!
                                .selectedPropertyIdList![0].propertyName;
                      }*/
                      registerListRequestModel.orderList!.add(newOrderList);
                    }

                    if (value.processingList == 0) {
                      return Text('سبد خرید خالی است.');
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.processingList.length,
                              itemBuilder: (context, index) {
                                return OrderItemConfirmWidget(
                                  customOrder:
                                      value.processingList[index].order!,
                                  index: index,
                                  productId:
                                      value.processingList[index].order!.id!,
                                  image: '',
                                  productName: value.processingList[index]
                                          .product!.titleFa ??
                                      'Name',
                                  salesType: value.processingList[index]
                                      .product!.supporting!
                                      .toString(),
                                  shopName: value.processingList[index].product!
                                          .shopId!.commercialName ??
                                      'Shop Name',
                                  branchName: value.processingList[index]
                                          .product!.branchId!.name ??
                                      'Branch Name',
                                  unit: value.processingList[index].product!
                                          .unit ??
                                      'Unit',
                                  packing: value.processingList[index].order!
                                                  .packId !=
                                              "" ||
                                          value.processingList[index].order!
                                                  .packId !=
                                              null
                                      ? value.processingList[index].calculated!
                                          .packInfo!.name
                                      : 'No Packing Info',
                                  calculatingProperty: value
                                                  .processingList[index]
                                                  .order!
                                                  .selectedPropertyIdList !=
                                              null &&
                                          value
                                                  .processingList[index]
                                                  .calculated!
                                                  .propertyListInfo !=
                                              null
                                      ? value.processingList[index].calculated!
                                          .propertyListInfo![0].name
                                      : 'No Calculating Property',
                                  discountSum: value.processingList[index]
                                          .calculated!.discountPriceRatio ??
                                      12,
                                  payAmount: value.processingList[index]
                                          .calculated!.total ??
                                      12,
                                  deliveryAddress: value.processingList[index]
                                          .order!.address ??
                                      'Address',
                                  quantity: value.processingList[index].order!
                                          .number ??
                                      123,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
