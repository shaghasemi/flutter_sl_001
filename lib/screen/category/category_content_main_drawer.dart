import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_category.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/category/category_all_model.dart';
import 'package:flutter_sl_001/screen/category/widget/category_list_widget.dart';

class CategoryContentScreen extends StatefulWidget {
  const CategoryContentScreen({Key? key}) : super(key: key);

  @override
  _CategoryContentScreenState createState() => _CategoryContentScreenState();
}

class _CategoryContentScreenState extends State<CategoryContentScreen> {
  ApiServiceCategory apiServiceCategory = ApiServiceCategory();
  late CategoryAllRequestModel categoryAllRequestModel; //late
  bool loginState = false;
  bool _isApiCallProcess = true;
  late List<Data> categoryListInfo;
  late List<Data> categoryListMain;
  late List<Data> categorySubOne;
  late List<Data> categorySubTwo;
  late List<Data> categorySubOneTemp;
  String? token = MySharedPreferences.mySharedPreferences.getString("token");

  @override
  void initState() {
    super.initState();
    categoryAllRequestModel = CategoryAllRequestModel(token: token!);
    categoryListInfo = [];
    categoryListMain = [];
    categorySubOne = [];
    categorySubTwo = [];
    categorySubOneTemp = [];
    fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Expansion Tile 0"),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: categoryListMain.length,
          itemBuilder: (context, index) =>
              Text(categoryListMain[index].titleFa ?? "عنوان 0"),
        )
      ],
    );
  }

  void fetchCategoryData() {
    apiServiceCategory.categoryAll(categoryAllRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        if (value.status == 200) {
          // print(value.toJson());
          categoryListInfo = value.data!;
          categoryListMain =
              categoryListInfo.where((element) => element.lvl == 0).toList();
          categorySubOne =
              categoryListInfo.where((element) => element.lvl == 1).toList();
          categorySubTwo =
              categoryListInfo.where((element) => element.lvl == 2).toList();
          MySharedPreferences.mySharedPreferences.setString(
            "category_data",
            value.data!.toString(),
          );
        }
      },
    ).whenComplete(
      () => _isApiCallProcess = false,
    );
  }
}
