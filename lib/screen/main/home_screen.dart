import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_shop_h_widget.dart';
import 'package:flutter_sl_001/screen/home/latest_products_widget.dart';
import 'package:flutter_sl_001/screen/home/search_widget.dart';
import 'package:flutter_sl_001/screen/main/profile_screen.dart';
import 'package:flutter_sl_001/screen/product/product_screen_temp.dart';

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
    var rawData = UserPreferences.newPrefs.getString('user_data');
    if (rawData != null) {
      userData = LoginResponseModel.fromJson(
          jsonDecode(UserPreferences.newPrefs.getString('user_data')!));
      _loginState = true;
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          const SliverAppBar(
            title: Text(
              "سیوان لند",
              style: TextStyle(
                  // color: Color(0xff28a745),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // Search
                SearchWidget(),

                // Static Advertisement
                // ListView Vertical
                BannerAdTopWidget(),

                // Latest Products
                Text("جدیدترین محصولات"),
                LatestProductsWidget(),


                // Weekly Special
                Text("محصول ویزه هفته"),

                // Links with Images

                // Image Slider - Shops
                Text("فروشگاه های برتر"),
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: BannerShopSliderWidget(),
                ),

                // Popular Categories
                Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
