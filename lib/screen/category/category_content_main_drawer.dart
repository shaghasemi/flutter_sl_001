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
  late List<Data> categoryListSubOne;
  late List<List<Data>> categorySubOne;
  late List<Data> categoryListSubTwo;
  late List<List<Data>> categorySubTwo;
  late List<Data> categorySubOneTemp;
  String? token = MySharedPreferences.mySharedPreferences.getString("token");

  @override
  void initState() {
    super.initState();
    categoryAllRequestModel = CategoryAllRequestModel(token: token!);
    categoryListInfo = [];
    // categoryListMainIterable = Iterable<Data>;
    categoryListMainIterable = [];
    categoryListMain = [];
    categoryListSubOne = [];
    categorySubOne = [[]];
    categoryListSubTwo = [];
    categorySubTwo = [[]];
    categorySubOneTemp = [];
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
                      itemCount: 5,
                      // itemCount: categorySubOne[i].length,
                      itemBuilder: (context, j) {
                        print(categorySubOne[i].length);
                        return SingleChildScrollView(
                          child: ExpansionTile(
                            title:
                                Text(categorySubOne[i][j].titleFa ?? "عنوان 1"),
                            /*children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: categorySubTwo[j].length,
                                itemBuilder: (context, k) =>
                                    Text(categorySubTwo[j][k].titleFa?? "عنوان 2"),
                              ),
                            ],*/
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
    apiServiceCategory.categoryAll(categoryAllRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        if (value.status == 200) {
          categoryListInfo = value.data!;
          categoryListMainIterable =
              categoryListInfo.where((element) => element.lvl == 0);
          categoryListMain =
              categoryListInfo.where((element) => element.lvl == 0).toList();

          // Defining structure of subcategories
          for (var y = 0; y < categoryListMain.length; y++) {
            print(categoryListMain.length);
            print("Y:");
            print(y);
            categorySubOne[y] = [];
          }
          // categorySubOne=[[],[],[]];
          categoryListSubOne =
              categoryListInfo.where((element) => element.lvl == 1).toList();
          categoryListSubTwo =
              categoryListInfo.where((element) => element.lvl == 2).toList();
          int x = 0;
          while (x < categoryListMain.length) {
            categorySubOne[x].addAll(
              categoryListSubOne.where(
                (element) {
                  return element.parentId ==
                      categoryListMainIterable.map((e) => e.id).elementAt(x);
                },
              ),
            );
            // print(categoryListSubOne);
            print("x1:  ");
            print(x);
            print("categorySubOne[ii]: ");
            print(categorySubOne);
            // print(categorySubOne[1]);
            x++;
            print("x2:  ");
            print(x);
          }
          /*for (int ii = 0; ii < categoryListMain.length; ii++) {
            categorySubOne[ii] = categoryListSubOne
                .where((element) => element.parentId == categoryListMain[ii].id)
                .toList();
            print("ii:  ");
            print(ii);
            print("categorySubOne[ii]: ");
            print(categorySubOne[ii]);
            */ /*for (var jj = 0; jj < categorySubOne[ii].length; jj++) {
              categorySubTwo[jj] = categoryListSubTwo
                  .where((element) =>
                      element.parentId == categorySubOne[ii][jj].id)
                  .toList();
            }*/ /*
          }*/

          /*for (var jj = 0; jj < categorySubOne[ii].length; jj++) {
            categorySubTwo[jj] = categoryListSubTwo
                .where(
                    (element) => element.parentId == categorySubOne[ii][jj].id)
                .toList();
          }*/
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
