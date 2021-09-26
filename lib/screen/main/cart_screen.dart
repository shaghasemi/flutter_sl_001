import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/screen/cart/cart_content_main.dart';
import 'package:flutter_sl_001/screen/helper/request_login.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/product/widget/product_order_list_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late String? token;
  APIService apiService = APIService();
  late OrderAllRequestModel orderAllRequestModel; //late
  bool isApiCallProcess = false;
  bool loginState = false;
  // late List<Data> orderListInfo;

  /* @override
  void initState() {
    super.initState();
    orderListInfo = [];
    token = MySharedPreferences.mySharedPreferences.getString("token");
    print(token);
    loginState = token != "";
    // orderAllRequestModel = OrderAllRequestModel(token: token);
    orderAllRequestModel.token = token!;
    apiService.orderAll(orderAllRequestModel).then(
      (value) {
        if (value.status == 200) {
          print(value.toJson());
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
  }*/

  /*@override
  void initState() {
    super.initState();
    orderAllRequestModel = OrderAllRequestModel(token: '');
  }*/

  /*@override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }*/

  @override
  Widget build(BuildContext context) {
    // orderListInfo = [];
    token = MySharedPreferences.mySharedPreferences.getString("token");
    /*setState(() {
      token = MySharedPreferences.mySharedPreferences.getString("token");
    });*/
    loginState = token != null;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: const Text(
              "سبد خرید",
              style: TextStyle(
                  // color: Color(0xff28a745),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ],
        body: loginState == false
            ? const RequestLoginScreen()
            :
            // UnderConstructionScreen()
        CartContent(
                token: token.toString(),
              ),
      ),
    );
  }
}
