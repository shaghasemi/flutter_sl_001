import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_category.dart';
import 'package:flutter_sl_001/model/category/category_sub_2.dart';
import 'package:flutter_sl_001/model/category/product_by_category_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/product/product_single_screen.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/src/extensions.dart';

class CategoryContentScreenTwo extends StatefulWidget {
  final String categoryId;
  final String? categoryName;

  const CategoryContentScreenTwo(
      {Key? key, required this.categoryId, this.categoryName})
      : super(key: key);

  @override
  _CategoryContentScreenState createState() => _CategoryContentScreenState();
}

class _CategoryContentScreenState extends State<CategoryContentScreenTwo> {
  ApiServiceCategory apiServiceCategory = ApiServiceCategory();
  bool _isApiCallProcess = false;

  CategorySubTwoRequestModel categorySubTwoRequestModel =
      CategorySubTwoRequestModel(status: 1, parentId: '');
  ProductListByCategoryRequestModel productListByCategoryRequestModel =
      ProductListByCategoryRequestModel(categoryId: '');
  List<CategorySubTwoData> categoryListInfoSubTwo = [CategorySubTwoData()];
  List<ProductListByCategoryData> productListInfo = [
    ProductListByCategoryData()
  ];
  bool _firstRun = true;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: _isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    categorySubTwoRequestModel.parentId = widget.categoryId;
    // Only on first run, products for level 1 are shown
    // After that, products will arrive from tapped categories
    if (_firstRun) {
      productListByCategoryRequestModel.categoryId = widget.categoryId;
      _firstRun = false;
    }
    Future<CategorySubTwoResponseModel> fetchCategoriesSubTwo() =>
        apiServiceCategory.categorySubTwo(categorySubTwoRequestModel);
    Future<ProductListByCategoryResponseModel> fetchProductByCategory() =>
        apiServiceCategory.productByCategory(productListByCategoryRequestModel);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Vazir',
            ),
            title: Text(widget.categoryName!),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: fetchCategoriesSubTwo(),
                builder: (context,
                    AsyncSnapshot<CategorySubTwoResponseModel> snapshot) {
                  if (snapshot.hasData) {
                    categoryListInfoSubTwo = snapshot.data!.data!;
                    return GridView.builder(
                      // scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      shrinkWrap: true,
                      itemCount: categoryListInfoSubTwo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              productListByCategoryRequestModel.categoryId =
                                  categoryListInfoSubTwo[index].id!;
                            });
                          },
                          child: Container(
                            child: Card(
                              elevation: 4,
                              color: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.dns,
                                      // size: 48,
                                      color: Colors.green.shade700,
                                    ),
                                    // SizedBox(height: 8),
                                    Text(
                                      categoryListInfoSubTwo[index].titleFa!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('بروز خطا هنگام دریافت دسته بندی ها'),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 8, 4),
                    child: Text(
                      'محصولات',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  FutureBuilder(
                    future: fetchProductByCategory(),
                    builder: (context,
                        AsyncSnapshot<ProductListByCategoryResponseModel>
                            snapshot) {
                      // Add connection state later
                      if (snapshot.hasData) {
                        productListInfo = snapshot.data!.data!;
                        return ListView.builder(
                          // scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(vertical: 0),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productListInfo.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductListItem(context, index);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('بروز خطا هنگام دریافت محصولات'),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ProductListItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductSingleScreen(product_id: productListInfo[index].id!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Card(
          elevation: 1,
          color: Colors.grey.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "${AppUrl.imageBaseUrl}${productListInfo[index].images![0].url}",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productListInfo[index].titleFa!,
                        // textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                        maxLines: 3,
                      ),
                      int.parse(productListInfo[index].discountPercent!) > 0
                          ? Row(
                              children: [
                                Text(
                                  productListInfo[index]
                                      .discountPercent
                                      .toString(),
                                ),
                                Text('درصد تخفیف'),
                              ],
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        productListInfo[index]
                            .price!
                            .toPersianDigit()
                            .seRagham(),
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        ' ریال',
                        style: TextStyle(fontSize: 10),
                      ),
                      /*if (productListInfo[index]
                                                    .discountPercent !=
                                                0)
                                              Text(
                                                productListInfo[index]
                                                    .discountPercent!
                                                    .toPersianDigit(),
                                                style:
                                                    TextStyle(fontSize: 16),
                                              )
                                            else
                                              SizedBox(),*/
                      /*Text(
                                              productListInfo[index]
                                                  .supporting
                                                  .toString(),
                                            ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
