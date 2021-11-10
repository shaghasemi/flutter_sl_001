import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/cart_provider.dart';
import 'package:flutter_sl_001/screen/cart/cusotmer_info_order.dart';
import 'package:flutter_sl_001/screen/cart/widget/order_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartContentScreen extends StatefulWidget {
  const CartContentScreen({Key? key}) : super(key: key);

  @override
  State<CartContentScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartContentScreen> {
  Future<String?> getToken() async => UserPreferences().getTokenAsync();

  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).loadOrder();
  }

  @override
  Widget build(BuildContext context) {
    // token = MySharedPreferences.mySharedPreferences.getString("token");
    // LoginData user = Provider.of<UserProvider>(context).getUser;
    // Future<List<ProcessingResponseData>> getCartData() => CartPreferences().loadCart();
    // CartPreferences().loadCart();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Vazir',
            ),
            title: const Text(
              "سبد خرید",
            ),
            // backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .clearCart();
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<CartProvider>(
                  builder: (context, value, child) {
                    if (value.processingList.length == 0) {
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
                                /*print("Null Checking Packing:");
                                print(
                                    value.processingList[index].order!.packId);
                                print(jsonEncode(value.processingList[index].calculated!
                                    .packInfo));*/
                                // print("Null Checking Calculating:");
                                // print(jsonEncode(value.processingList[index].calculated!.propertyListInfo));
                                // print(jsonEncode(value.processingList[0].order));
                                return OrderItemWidget(
                                  customOrder:
                                      value.processingList[index].order!,
                                  index: index,
                                  productId:
                                      value.processingList[index].order!.id!,
                                  image: value
                                      .processingList[index].product!.images,
                                  productName: value.processingList[index]
                                          .product!.titleFa ??
                                      'Name',
                                  salesType: value.processingList[index]
                                      .product!.supporting!
                                      .toString(),
                                  shopName: value.processingList[index].product!
                                          .shopId!.commercialName ??
                                      'No Shop Name',
                                  branchName: value.processingList[index]
                                          .product!.branchId!.name ??
                                      'No Branch Name',
                                  unit: value.processingList[index].product!
                                          .unit ??
                                      'No Unit',
                                  packing: value.processingList[index].order!
                                                  .packId !=
                                              "" ||
                                          value.processingList[index].order!
                                                  .packId !=
                                              null
                                      ? value.processingList[index].calculated!
                                          .packInfo!.name
                                      : null,
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
                                      : null,
                                  calculatingPropertyUnit: value
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
                                          .propertyListInfo![0].propertyName
                                      : null,
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
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(8),
            padding: MaterialStateProperty.all(
              EdgeInsets.fromLTRB(12, 10, 18, 10),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'تایید آیتم ها و ادامه',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward),
          ],
        ),
        onPressed: () {
          getToken().then(
            (value) {
              print("Token: $value");
              if (value != null && value != '') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerInfoOrderScreen()),
                );
              } else {
                Fluttertoast.showToast(
                  msg: 'جهت ثبت سفارش، وارد حساب کاربری خود شوید.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  // fontSize: 16.0,
                );
              }
            },
          ).onError(
            (error, stackTrace) {
              // print("Order Confirmed 2: ${error}");
              Fluttertoast.showToast(
                msg: 'جهت ثبت سفارش، وارد حساب کاربری خود شوید.',
                // msg: error.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                // fontSize: 16.0,
              );
            },
          );
        },
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        elevation: 4,
        // child: Text('ویرایش'),

        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerInfoOrderScreen()),
          );
        },
        label: Text('تایید و ادامه'),
      ),*/
    );
  }
}
