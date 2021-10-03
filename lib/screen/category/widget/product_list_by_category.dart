import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_category.dart';
import 'package:flutter_sl_001/model/category/product_list_by_category_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';

class ProductListByCategoryWidget extends StatefulWidget {
  final String token;
  final String categoryId;

  const ProductListByCategoryWidget(
      {Key? key, required this.token, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListByCategoryWidget> createState() =>
      _ProductListByCategoryWidgetState();
}

class _ProductListByCategoryWidgetState
    extends State<ProductListByCategoryWidget> {
  late ProductListByCategoryRequestModel productListByCategoryRequestModel;
  late List<Data> productByCategoryListInfo;
  bool _isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    productByCategoryListInfo = [];
    fetchProductByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: _isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScroller) => [
        const SliverAppBar(
          title: Text(
            "محصولات در دسته بندی",
            style: TextStyle(
                // color: Color(0xff28a745),
                fontWeight: FontWeight.bold,
                fontFamily: 'Vazir'),
          ),
          backgroundColor: Color(0xff28a745),
          snap: true,
          centerTitle: true,
          floating: true,
        ),
      ],
      body: SingleChildScrollView(
        // physics: ScrollPhysics(),
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productByCategoryListInfo.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.asset("assets/images/awaiting_payment.png"),
                      Text(productByCategoryListInfo[index].titleFa ??
                          "Product Title"),
                      SizedBox(height: 400),
                      Text(productByCategoryListInfo[index].shopId ?? "Seller"),
                      Text(productByCategoryListInfo[index].price ??
                          "Price Maybe"),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void fetchProductByCategory() {
    ApiServiceCategory apiServiceCategory = ApiServiceCategory();
    productListByCategoryRequestModel = ProductListByCategoryRequestModel(
      token: widget.token,
      categoryId: widget.categoryId,
    );
    apiServiceCategory
        .productByCategory(productListByCategoryRequestModel)
        .then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      if (value.status == 200) {
        productByCategoryListInfo = value.data!;
      }
    }).whenComplete(
      () => _isApiCallProcess = false,
    );
  }
}
