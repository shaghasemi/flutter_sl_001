import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/order/register_list_model.dart';
import 'package:flutter_sl_001/provider_test/cart_provider.dart';
import 'package:flutter_sl_001/screen/cart/widget/order_item_confirm_widget.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';
import 'package:provider/provider.dart';

class ConfirmOrderScreen extends StatefulWidget {
  // RegisterListRequestModel registerListRequestModel;
  Customer_info customerInfo;
  String token;

  ConfirmOrderScreen(
      {Key? key, required this.customerInfo, required this.token})
      : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();
  late RegisterListRequestModel registerListRequestModel;

  @override
  void initState() {
    super.initState();
    registerListRequestModel = RegisterListRequestModel(
      token: widget.token,
      customerInfo: widget.customerInfo,
      // orderList: [Order_list()],
      orderList: [],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  apiServiceOrder
                      .registerListOrder(registerListRequestModel)
                      .then((value) {
                    print("Got some response");
                    print(value.message);
                    print("jsonEncode(value.data)");
                    print(jsonEncode(value.data));
                    CartProvider().clearCart();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                    onError: (err) {
                      print("Error1" + err);
                    },
                  );
                },
                child: Text("تایید اطلاعات"),
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
                    for (int i = 0; i < 1; i++) {
                      registerListRequestModel.orderList![i].id =
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
                      }
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
