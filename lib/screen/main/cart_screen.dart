import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/provider/cart_provider.dart';
import 'package:flutter_sl_001/screen/cart/cusotmer_info_order.dart';
import 'package:flutter_sl_001/screen/cart/widget/order_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            title: const Text(
              "سبد خرید",
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // fontFamily: 'Vazir',
                  ),
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
                                      // : 'No Calculating Property',
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
                SizedBox(height: 50,),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerInfoOrderScreen()),
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