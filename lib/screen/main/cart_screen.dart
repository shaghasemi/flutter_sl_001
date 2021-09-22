import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/screen/product/widget/product_order_list_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  APIService apiService = APIService();
  late OrderAllRequestModel orderAllRequestModel; //late
  bool isApiCallProcess = false;
  late List<Data> orderListInfo;

  @override
  void initState() {
    super.initState();
    orderListInfo = [];
    orderAllRequestModel = OrderAllRequestModel(
        token: MySharedPreferences.mySharedPreferences.getString("token")!);
    apiService.orderAll(orderAllRequestModel).then(
      (value) {
        if (value.status == 200) {
          orderListInfo = value.data!;
          MySharedPreferences.mySharedPreferences.setString(
            "order_data",
            value.data!.toString(),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                // title: Text(value.error.toString()),
                content: Text(value.message.toString()),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  ElevatedButton(
                    child: const Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        isApiCallProcess = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar: Cart Screen"),
      ),
      body: ListView.builder(
        itemCount: orderListInfo.length,
        itemBuilder: (context, index) {
          return ProductListOrderWidget(
            price_original:
                orderListInfo[index].otherPrice ?? 'Price (PlaceHolder)',
            // price_original: '',
            quantity: orderListInfo[index].number ?? 1024,
            seller_branch:
                orderListInfo[index].branchId ?? 'Branch (PlaceHolder)',
            delivery_address:
                orderListInfo[index].address ?? 'Price (PlaceHolder)',
            image_logo: 'assets/images/processing.png',
            seller_main:
                orderListInfo[index].province!.name ?? 'Price (PlaceHolder)',
            title: orderListInfo[index].productId ?? 'Price (PlaceHolder)',
            delivery_date:
                orderListInfo[index].createdAt ?? 'Price (PlaceHolder)',
          );
        },
      ),
    );
  }
}
