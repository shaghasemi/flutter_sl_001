import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/product/product_latest_model.dart';

class LatestProductsWidget extends StatefulWidget {
  const LatestProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LatestProductsWidget> createState() => _LatestProductsWidgetState();
}

class _LatestProductsWidgetState extends State<LatestProductsWidget> {
  ApiServiceProduct apiServiceProduct = ApiServiceProduct();
  late ProductLatestData latestProductInfo;
  late Future<ProductLatestData> latestProducts;
  late ProductLatestRequestModel productLatestRequestModel;

  @override
  void initState() {
    super.initState();
    latestProductInfo = ProductLatestData();
    productLatestRequestModel = ProductLatestRequestModel(num: 6, cat_id: "614afe068b86328f37d4028c");
    fetchLatestProducts();
    // latestProducts = fetchLatestProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: latestProductInfo.docs!.length,
      itemBuilder: (context, index) {
        return Text(latestProductInfo.docs![index].id!);
      },
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: latestProducts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data.,
            itemBuilder:,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }*/

  fetchLatestProducts() {
    apiServiceProduct.productLatest(productLatestRequestModel).then((value) {
      print("value.message Latest:");
      print(value.status);
      print(value.message);
      latestProductInfo = value.data!;
    });
  }
}
