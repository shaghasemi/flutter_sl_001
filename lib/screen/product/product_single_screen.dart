import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/provider_test/cart_product_list.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:provider/provider.dart';

class ProductSingleScreen extends StatefulWidget {
  final String product_id;

  const ProductSingleScreen({
    Key? key,
    required this.product_id,
  }) : super(key: key);

  @override
  State<ProductSingleScreen> createState() => _ProductSingleScreenState();
}

class _ProductSingleScreenState extends State<ProductSingleScreen> {
  ApiServiceProduct apiServiceProduct = ApiServiceProduct();
  late ProductSingleRequestModel productSingleRequestModel;
  ProductSingleData productSingleData = ProductSingleData();

  @override
  void initState() {
    super.initState();
    productSingleRequestModel =
        ProductSingleRequestModel(id: widget.product_id);
  }

  Widget build(BuildContext context) {
    Future<ProductSingleData> getSingleProductData() =>
        apiServiceProduct.productSingle(productSingleRequestModel);
    return FutureBuilder(
      future: getSingleProductData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          productSingleData =
              ProductSingleData.fromJson(jsonDecode(jsonEncode(snapshot.data)));
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScroller) => [
              SliverAppBar(
                title: Text(
                  productSingleData.titleFa!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
                ),
                backgroundColor: Color(0xff28a745),
                snap: true,
                centerTitle: true,
                floating: true,
              ),
            ],
            body: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: productSingleData.images!.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                              "${AppUrl.imageBaseUrl}${productSingleData.images![index].url}");
                        }),
                  ),
                  /*Image.network(
                      "${AppUrl.imageBaseUrl}${productSingleData.images![0].url}"),*/
                  Text("Product Page"),
                  // Text(productInfo.titleFa!),
                  // Text(productInfo.likes.toString()),
                  // Text(productInfo.supporting.toString()),
                  // Text(productInfo.unit.toString()),
                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<CartProductList>(context, listen: false)
                            .addProductToCart(
                      // id: productInfo.id.toString(),
                      id: productSingleData.id!,
                    ),
                    child: Text("اضافه کردن به سبد خرید"),
                  ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  void addToCart() {}
}
