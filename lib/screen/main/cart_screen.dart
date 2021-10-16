import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/provider_test/user_provider.dart';
import 'package:flutter_sl_001/screen/cart/cart_content_main.dart';
import 'package:flutter_sl_001/screen/cart/cart_content_provider.dart';
import 'package:flutter_sl_001/screen/helper/request_login.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/product/widget/product_order_list_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // bool loginState = false;
  // String? token = UserPreferences.newPrefs.getString("token");

  /*@override
  void initState() {
    super.initState();
    loginState = checkLoginState(token);
  }*/

  @override
  Widget build(BuildContext context) {
    // orderListInfo = [];
    // token = MySharedPreferences.mySharedPreferences.getString("token");
    LoginData user = Provider.of<UserProvider>(context).getUser;
    /*setState(() {
      token = UserPreferences.newPrefs.getString("token");
    });*/

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
                    print("Refresh: ");
                    /*Consumer<UserProvider>(
                      builder: (context, value, child) {
                        print("value:");
                      },
                    );*/
                    /*setState(() {
                      loginState = token != null;
                    });*/
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ],
        /*body: loginState == false
            ? const RequestLoginScreen()
            // : CartContent(token: token.toString()),
            : CartContent(),*/
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Consumer"),
                Consumer<UserProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Text(value.getUser.mobile.toString()),
                        Text(jsonEncode(value.getUser)),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Provider Of"),
                Text(user.toString()),
                Text(jsonEncode(user)),
                Text(user.mobile.toString()),
                SizedBox(
                  height: 50,
                ),
                Text("Shared Pref Get User"),
                FutureBuilder(
                  future: UserPreferences().getUser(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        // Text(UserPreferences().getUser().toString() ?? "Get User 1"),
                        /*Text(LoginData.fromJson(
                                    jsonDecode(jsonEncode(snapshot.data)))
                                .mobile ??
                            "Snapshot Data"),*/
                        // Text(snapshot.data<LoginData>),
                        // Text(LoginData.fromJson(snapshot.data as Map<String,dynamic>).mobile!),
                        // Text(jsonEncode(UserPreferences().getUser())),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Shared Pref Original"),
                Text(UserPreferences.newPrefs.getString("token").toString())
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
