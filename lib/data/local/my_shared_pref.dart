import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences mySharedPreferences;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Future.delayed(const Duration(seconds: 2));
    mySharedPreferences = await SharedPreferences.getInstance();
  }
}
