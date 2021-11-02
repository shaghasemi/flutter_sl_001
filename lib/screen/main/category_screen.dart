import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/category/category_content_list.dart';

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
