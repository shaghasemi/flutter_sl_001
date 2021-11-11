import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_slider_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_ad_top_static_widget.dart';
import 'package:flutter_sl_001/screen/home/banner_shop_h_widget.dart';
import 'package:flutter_sl_001/screen/home/call_to_action_widget.dart';
import 'package:flutter_sl_001/screen/home/favorite_categories_slider_widget.dart';
import 'package:flutter_sl_001/screen/home/home_content_screen.dart';
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
    return HomeContentScreen();
  }
}
