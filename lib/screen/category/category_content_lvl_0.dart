import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_category.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/model/category/category_all_model.dart';
import 'package:flutter_sl_001/model/category/category_all_model_saeed.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/category/widget/product_list_by_category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'category_content_lvl_2.dart';

class CategoryContentScreenZero extends StatefulWidget {
  const CategoryContentScreenZero({Key? key}) : super(key: key);

  @override
  _CategoryContentScreenState createState() => _CategoryContentScreenState();
}

class _CategoryContentScreenState extends State<CategoryContentScreenZero> {
  ApiServiceCategory apiServiceCategory = ApiServiceCategory();
  bool _isApiCallProcess = false;

  CategoryAllRequestModelSaeed categoryAllRequestModelSaeed =
      CategoryAllRequestModelSaeed();
  List<CategoryAllModelSaeedData> categoryListInfo = [
    CategoryAllModelSaeedData()
  ];

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: _isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    // String? token = user.token;
    Future<CategoryAllModelSaeed> fetchCategories() =>
        apiServiceCategory.categorySaeed();
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, AsyncSnapshot<CategoryAllModelSaeed> snapshot) {
        if (snapshot.hasData) {
          categoryListInfo = snapshot.data!.data!;
          return SingleChildScrollView(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categoryListInfo.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 8,
                          ),
                          child: Text(
                            categoryListInfo[index].titleFa!,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          alignment: Alignment.centerRight,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: categoryListInfo[index].subCat1!.length,
                            itemBuilder: (BuildContext context, int index1) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryContentScreenTwo(
                                              categoryId:
                                                  categoryListInfo[index]
                                                      .subCat1![index1]
                                                      .id!),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 120,
                                  height: 140,
                                  child: Card(
                                    elevation: 4,
                                    color: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.dns,
                                            size: 48,
                                            color: Colors.green.shade700,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            categoryListInfo[index]
                                                .subCat1![index1]
                                                .titleFa!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 8,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 2,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('بروز خطا هنگام دریافت دسته بندی ها'),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void fetchCategoryData() {
    apiServiceCategory.categorySaeed().then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      categoryListInfo = value.data!;
    }).onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        () => _isApiCallProcess = false;
      },
    );
  }
}
