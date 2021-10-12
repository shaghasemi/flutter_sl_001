import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/provider_test/cart_product_list.dart';
import 'package:flutter_sl_001/model/product/product_all_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/provider_test/cart_model.dart';
import 'package:provider/provider.dart';

class ProductScreenTemp extends StatefulWidget {
  const ProductScreenTemp({Key? key}) : super(key: key);

  @override
  State<ProductScreenTemp> createState() => _ProductScreenTempState();
}

class _ProductScreenTempState extends State<ProductScreenTemp> {
  late ProductAllRequestModel productAllRequestModel;
  late List<Data> productAllInfo;
  bool _isApiCallProcess = false;
  String token =
      UserPreferences.prefs.getString("token") ?? "No Token";

  @override
  void initState() {
    super.initState();
    // String? token = MySharedPreferences.mySharedPreferences.getString("token");
    productAllInfo = [];
    fetchProductAll();
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
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fetchProductAll();
                });
              },
              child: Text("View Products"),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productAllInfo.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Text(productAllInfo[index].titleFa!),
                    ElevatedButton(
                      onPressed: () =>
                          Provider.of<CartProductList>(context, listen: false)
                              .addProductToCart(id: "Some id"),
                      child: Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fetchProductAll() {
    ApiServiceProduct apiServiceProduct = ApiServiceProduct();
    productAllRequestModel = ProductAllRequestModel(token: token);
    apiServiceProduct.productAll(productAllRequestModel).then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      if (value.status == 200) {
        productAllInfo = value.data!;
      }
    }).whenComplete(
      () => _isApiCallProcess = false,
    );
  }
}
