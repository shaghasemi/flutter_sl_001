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
  late List<Data> categoryListInfo;
  late List<Data> categoryListMain;
  bool _isApiCallProcess = true;
  String? token = MySharedPreferences.mySharedPreferences.getString("token");

  @override
  void initState() {
    super.initState();
    categoryAllRequestModel = CategoryAllRequestModel(token: token!);
    categoryListInfo = [];
    categoryListMain = [];
    apiServiceCategory.categoryAll(categoryAllRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        print("Requested Category All");
        if (value.status == 200) {
          print(value.toJson());
          categoryListInfo = value.data!;
          categoryListMain =
              categoryListInfo.where((element) => element.lvl == 0).toList();
          MySharedPreferences.mySharedPreferences.setString(
            "category_data",
            value.data!.toString(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      /*itemCount: categoryListInfo.length,
      itemBuilder: (context, index) {
        return CategoryListWidget(
          title_fa: categoryListInfo[index].titleFa ?? 'عنوان دسته',
          title_en:
              categoryListInfo[index].titleEn ?? 'PlaceHolder: Category Title',
          slug: categoryListInfo[index].slug ?? 'PlaceHolder: Slug',
          lvl: categoryListInfo[index].lvl ?? 99,
        );
      },*/
      itemCount: categoryListMain.length,
      itemBuilder: (context, index) {
        return CategoryListWidget(
          title_fa_0: categoryListMain[index].titleFa ?? 'عنوان دسته',
          title_en_0:
              categoryListMain[index].titleEn ?? 'PlaceHolder: Category Title',
          slug_0: categoryListMain[index].slug ?? 'PlaceHolder: Slug',
          lvl_0: categoryListMain[index].lvl ?? 99,
          title_fa_1: categoryListMain[index].titleFa ?? 'عنوان دسته',
          title_en_1:
              categoryListMain[index].titleEn ?? 'PlaceHolder: Category Title',
        );
      },
    );
  }
}
