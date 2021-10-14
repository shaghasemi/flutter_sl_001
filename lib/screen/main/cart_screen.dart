import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/screen/cart/cart_content_main.dart';
import 'package:flutter_sl_001/screen/cart/cart_content_provider.dart';
import 'package:flutter_sl_001/screen/helper/request_login.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/product/widget/product_order_list_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool loginState = false;
  String? token = UserPreferences.prefs.getString("token");

  @override
  void initState() {
    super.initState();
    loginState = checkLoginState(token);
  }

  @override
  Widget build(BuildContext context) {
    // orderListInfo = [];
    // token = MySharedPreferences.mySharedPreferences.getString("token");
    setState(() {
      token = UserPreferences.prefs.getString("token");
    });

    // loginState = token != null;

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
                    setState(() {
                      loginState = token != null;
                    });
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ],
        body: loginState == false
            ? const RequestLoginScreen()
            // : CartContent(token: token.toString()),
            : CartContent(),
      ),
    );
  }
}

checkLoginState(String? token) {
  if (token != null) {
    return true;
  } else {
    return false;
  }
}
