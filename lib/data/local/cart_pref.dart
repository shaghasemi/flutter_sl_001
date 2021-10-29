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
    cartPrefs.setString('cart', jsonEncode(orderList));
  }

  List<ProcessingResponseData> loadCart() {
    String? cartData = cartPrefs.getString('cart');
    return [ProcessingResponseData.fromJson(jsonDecode(cartData!))];
  }

}
