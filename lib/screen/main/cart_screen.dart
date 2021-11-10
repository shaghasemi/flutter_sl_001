import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/cart_provider.dart';
import 'package:flutter_sl_001/screen/cart/cart_content_screen.dart';
import 'package:flutter_sl_001/screen/cart/cusotmer_info_order.dart';
import 'package:flutter_sl_001/screen/cart/widget/order_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<String?> getToken() async => UserPreferences().getTokenAsync();

  @override
  Widget build(BuildContext context) {
    return CartContentScreen();
  }
}
