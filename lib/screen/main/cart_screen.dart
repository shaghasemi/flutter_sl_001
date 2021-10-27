import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/provider_test/cart_product_list.dart';
import 'package:flutter_sl_001/provider_test/user_provider.dart';
import 'package:flutter_sl_001/screen/cart/widget/OrderItemWidget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // token = MySharedPreferences.mySharedPreferences.getString("token");
    LoginData user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: const Text(
              "سبد خرید",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                  onPressed: () {
                    // TODO: Remove This Button
                    print("Refresh: ");
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<CartOrderList>(
                  builder: (context, value, child) {
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
                                // return Text(value.productList[index].id!);
                                return OrderItemWidget(
                                  image: '',
                                  productName: value
                                      .processingList[index].product!.titleFa!,
                                  salesType: value.processingList[index]
                                      .product!.supporting!
                                      .toString(),
                                  shopName: value.processingList[index].product!
                                      .shopId!.commercialName!,
                                  branchName: value.processingList[index]
                                      .product!.branchId!.name!,
                                  unit: value
                                      .processingList[index].product!.unit!,
                                  packing: value.processingList[index]
                                      .calculated!.packInfo!.name,
                                  calculatingProperty: value
                                          .processingList[index]
                                          .calculated!
                                          .propertyListInfo![0]
                                          .name ??
                                      '',
                                  discountSum: value.processingList[index]
                                      .calculated!.discountPriceRatio!,
                                  payAmount: value
                                      .processingList[index].calculated!.total!,
                                  deliveryAddress: value
                                      .processingList[index].order!.address!,
                                  quantity: value
                                      .processingList[index].order!.number!,
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

/*checkLoginState(String? token) {
  if (token != null) {
    return true;
  } else {
    return false;
  }
}*/
