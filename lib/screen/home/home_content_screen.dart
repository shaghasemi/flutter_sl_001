import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_slider_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_static_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_shop_h_widget.dart';
import 'package:flutter_sl_001/screen/home/call_to_action_widget.dart';
import 'package:flutter_sl_001/screen/home/favorite_categories_slider_widget.dart';
import 'package:flutter_sl_001/screen/home/latest_products_widget.dart';
import 'package:flutter_sl_001/screen/home/search_widget.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({Key? key}) : super(key: key);

  @override
  State<HomeContentScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeContentScreen> {
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
                  SizedBox(height: 8),

                  // Slider Advertisement
                  BannerAdTopSliderWidget(),

                  // Favorite Categories
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 18, 8, 4),
                    child: Text(
                      "دسته های پرطرفدار",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  FavoriteCategoriesSliderWidget(),

                  // Static Advertisement
                  /*Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 4),
                    child: Text(
                      "دسته های پرطرفدار",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),*/
                  BannerAdTopStaticWidget(),

                  // Latest Products
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 18, 8, 4),
                    child: Text(
                      "جدیدترین محصولات",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  LatestProductsWidget(),

                  SizedBox(height: 18),
                  CallToActionWidget(),

                  // Weekly Special
                  // Text("محصول ویزه هفته"),

                  // Links with Images

                  // Image Slider - Shops
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 18, 8, 4),
                    child: Text(
                      "فروشگاه های برتر",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  BannerShopSliderWidget(),
                  SizedBox(height: 18),

                  // Popular Categories
                  // Row(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
