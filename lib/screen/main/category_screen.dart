import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/screen/category/category_content_list.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/panel/signup_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {

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
