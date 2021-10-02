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
  late List<Data> categorySubOne;
  late List<Data> categorySubTwo;
  late List<Data> categorySubOneTemp;
  bool _isApiCallProcess = true;
  String? token = MySharedPreferences.mySharedPreferences.getString("token");

  @override
  void initState() {
    super.initState();
    print("Called After Super initState");
    categoryAllRequestModel = CategoryAllRequestModel(token: token!);
    categoryListInfo = [];
    categoryListMain = [];
    categorySubOne = [];
    categorySubTwo = [];
    categorySubOneTemp = [];
    /*apiServiceCategory.categoryAll(categoryAllRequestModel).then(
      (value) {
        print("Called in API call");
        setState(() {
          _isApiCallProcess = false;
        });
        print("Requested Category All");
        if (value.status == 200) {
          print(value.toJson());
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
    );*/
  }

  @override
  Widget build(BuildContext context) {
    // future: fetchCategoryData();
    setState(() {
      fetchCategoryData();
    });
    // fetchCategoryData();
    return ListView.builder(
      itemCount: categoryListMain.length,
      itemBuilder: (context, i) {
        categorySubOneTemp = categorySubOne
            .where((element) => element.parentId == categoryListMain[i].id)
            .toList();
        return Text(categoryListMain[i].titleFa ?? "عنوان سطح 0");
        /*return SizedBox(
          height: 100,
          child: Column(
            */ /*categorySubOneTemp =
                    categorySubOne.where((element) => element.parentId ==
                        categoryListMain[i].id).toList();*/ /*
            children: [
              Text(categoryListMain[i].titleFa ?? "عنوان سطح 0"),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorySubOneTemp.length,
                  itemBuilder: (context, j) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Text(categorySubOne
                            .where((element) =>
                                element.parentId == categoryListMain[i].id)
                            .toList()[j]
                            .titleFa ??
                        "عنوان سطح 0"),
                  ),
                ),
              )
            ],
          ),
        );*/
      },
    );
    /*return ListView.builder(
      itemCount: categoryListMain.length,
      itemBuilder: (context, index) {
        return CategoryListWidget(
          title_fa_0: categoryListMain[index].titleFa ?? 'عنوان دسته',
          title_en_0:
              categoryListMain[index].titleEn ?? 'PlaceHolder: Category Title',
          slug_0: categoryListMain[index].slug ?? 'PlaceHolder: Slug',
          lvl_0: categoryListMain[index].lvl ?? 99,
          itemCountSubOne: categorySubOne.length,
          title_fa_1: categorySubOne[index].titleFa ?? 'عنوان دسته',
          title_en_1:
              categorySubOne[index].titleEn ?? 'PlaceHolder: Category Title',
        );
      },
    );*/
  }

  void fetchCategoryData() {
    apiServiceCategory.categoryAll(categoryAllRequestModel).then(
      (value) {
        print("Called in API call");
        setState(() {
          _isApiCallProcess = false;
        });
        print("Requested Category All");
        if (value.status == 200) {
          print(value.toJson());
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
    );
  }
}
