import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool _loginState = false;
    var userData;
    var rawData =
    MySharedPreferences.mySharedPreferences.getString('user_data');
    if (rawData != null) {
      userData = LoginResponseModel.fromJson(jsonDecode(
          MySharedPreferences.mySharedPreferences.getString('user_data')!));
      _loginState = true;
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) =>
        [
          const SliverAppBar(
            title: Text(
              "سیوان لند",
              style: TextStyle(
                // color: Color(0xff28a745),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir'
              ),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: Column(
          children:[
            // Image Slider - Advertisement

            // Popular Categories
            Row(),

            // New Products
            // Listview Horizontal

            // Static Advertisement
            // ListView Vertical

            // Special Products
            // Listview Horizontal

            // Top Sellers
            // Listview Horizontal

          ]
        ),
      ),
    );
  }
}
