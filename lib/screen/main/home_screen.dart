import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_slider_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_static_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_shop_h_widget.dart';
import 'package:flutter_sl_001/screen/home/call_to_action_widget.dart';
import 'package:flutter_sl_001/screen/home/favorite_categories_slider_widget.dart';
import 'package:flutter_sl_001/screen/home/latest_products_widget.dart';
import 'package:flutter_sl_001/screen/home/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScroller) => [
            SliverAppBar(
              // leading: SearchWidget(),
              title: SearchWidget(),
              backgroundColor: Color(0xDBE7DDFF),
              snap: true,
              // pinned: true,
              // centerTitle: true,
              floating: true,
            ),
          ],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Slider Advertisement
                  BannerAdTopSliderWidget(),

                  // Favorite Categories
                  Text("دسته های پرطرفدار"),
                  FavoriteCategoriesSliderWidget(),

                  // Static Advertisement
                  BannerAdTopStaticWidget(),

                  // Latest Products
                  Text("جدیدترین محصولات"),
                  LatestProductsWidget(),

                  CallToActionWidget(),

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
      ),
    );
  }
}
