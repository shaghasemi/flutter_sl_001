import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/category/category_content_list.dart';
import 'package:flutter_sl_001/screen/category/category_content_lvl_0.dart';

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
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'Vazir',
        ),
        title: const Text(
          "دسته بندی",
        ),
        centerTitle: true,
      ),
      // body: const CategoryContentScreen(),
      body: const CategoryContentScreenZero(),
    );
  }
}
