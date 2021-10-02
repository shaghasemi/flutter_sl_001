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

  // late Iterable<Data>> categoryListMainIterable;
  late Iterable<Data> categoryListMainIterable;
  late List<Data> categoryListMain;
  late List<Data> categorySubOneAll;
  late List<List<Data>> categorySubOne;
  late List<Data> categorySubTwoAll;
  late List<List<Data>> categorySubTwo;
  String? token = MySharedPreferences.mySharedPreferences.getString("token");

  @override
  void initState() {
    super.initState();
    categoryAllRequestModel = CategoryAllRequestModel(token: token!);
    categoryListInfo = [];
    categoryListMainIterable = [];
    categoryListMain = [];
    categorySubOneAll = [];
    categorySubOne = [];
    categorySubTwoAll = [];
    categorySubTwo = [];
    fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionTile(
        title: Text("Expansion Tile 0"),
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categoryListMain.length,
            itemBuilder: (context, i) {
              return SingleChildScrollView(
                child: ExpansionTile(
                  title: Text(categoryListMain[i].titleFa ?? "عنوان 0"),
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: categorySubOne[i].length,
                      // itemCount: 5,
                      itemBuilder: (context, j) {
                        return SingleChildScrollView(
                          child: ExpansionTile(
                            title:
                                Text(categorySubOne[i][j].titleFa ?? "عنوان 1"),
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: categorySubTwo[j].length,
                                itemBuilder: (context, k) =>
                                    Text(categorySubTwo[j][k].titleFa?? "عنوان 2"),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void fetchCategoryData() {
    apiServiceCategory.categoryAll(categoryAllRequestModel).then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      if (value.status == 200) {
        categoryListInfo = value.data!;

        categoryListMain =
            categoryListInfo.where((element) => element.lvl == 0).toList();
        categorySubOneAll =
            categoryListInfo.where((element) => element.lvl == 1).toList();
        categorySubTwoAll =
            categoryListInfo.where((element) => element.lvl == 2).toList();

        for (int counter1 = 0; counter1 < categoryListMain.length; counter1++) {
          categorySubOne.add([]);
        }
        for (int x = 0; x < categoryListMain.length; x++) {
          categorySubOne[x] = categorySubOneAll
              .where(
                (element) =>
                    element.parentId ==
                    categoryListMain.map((e) => e.id).elementAt(x),
              )
              .toList();
          for (int counter2 = 0;
              counter2 < categorySubOne[x].length;
              counter2++) {
            categorySubTwo.add([]);
          }
          for (var y = 0; y < categorySubOne[x].length; y++) {
            categorySubTwo[y] = categorySubTwoAll
                .where((element) =>
                    element.parentId ==
                    categorySubOne[x].map((e) => e.id).elementAt(y))
                .toList();
          }
        }
      MySharedPreferences.mySharedPreferences.setString(
        "category_data",
        value.data!.toString(),
      );
    }).whenComplete(
      () => _isApiCallProcess = false,
    );
  }
}
