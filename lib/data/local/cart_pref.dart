import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPreferences {
  static late SharedPreferences cartPrefs;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    cartPrefs = await SharedPreferences.getInstance();
  }

  // Without list from parent function
  Future<void> saveCart(List<ProcessingResponseData> orderList) async {
    print("CartPref Save Called");
    cartPrefs.setString('cart', jsonEncode(orderList));
    print("CartPref Saved Data: ${jsonEncode(orderList)}");
  }

  // Future<ProcessingResponseData> loadCart() async {
  Future<List<ProcessingResponseData>> loadCart() async {
    String? cartData = cartPrefs.getString('cart');
    if (cartData != null) {
      List dataList = jsonDecode(cartData);
      List<ProcessingResponseData> dataResult =
          dataList.map((e) => ProcessingResponseData.fromJson(e)).toList();
      return dataResult;
    } else {
      throw Exception('No Order Data Available!');
    }
  }
}
