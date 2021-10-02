import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
// import 'package:flutter_sl_001/screen/category/category_content_main_digi.dart';
import 'package:flutter_sl_001/screen/category/category_content_main_last.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/panel/signup_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    /*bool _loginState = false;
    String _loginStringState = "Default";
    var token = MySharedPreferences.mySharedPreferences.getString('token');
    _loginState = token == null;
    _loginState
        ? _loginStringState = "Not Logged In"
        : _loginStringState = "Logged In";
    updateLoginState() {
      setState(() {
        _loginState = token == null;
        _loginState
            ? _loginStringState = "Not Logged In"
            : _loginStringState = "Logged In";
      });
      return _loginStringState;
    }*/

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "دسته بندی",
          style: TextStyle(fontFamily: 'Vazir'),
        ),
        centerTitle: true,
      ),
      body: const CategoryContentScreen(),
    );
  }
}
