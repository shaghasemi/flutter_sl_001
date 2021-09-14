import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences myShrdPref;

  static Future init() async {
    myShrdPref = await SharedPreferences.getInstance();
  }
}
