import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/product/product_latest_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class LatestProductsWidget extends StatefulWidget {
  const LatestProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LatestProductsWidget> createState() => _LatestProductsWidgetState();
}

class _LatestProductsWidgetState extends State<LatestProductsWidget> {
  ApiServiceProduct apiServiceProduct = ApiServiceProduct();

  late Future<ProductLatestData> latestProducts;
  late ProductLatestRequestModel productLatestRequestModel;
  late ProductLatestData latestProductData;

  @override
  void initState() {
    super.initState();
    // latestProductInfo = ProductLatestData();
    latestProductData = ProductLatestData();
    productLatestRequestModel = ProductLatestRequestModel(
      num: 6,
      cat_id: "614985f04523f62e604de269",
      limit: 6,
      page: 1,
    );
    print("Going to fetch latest products");
    // fetchLatestProductsData(productLatestRequestModel);
  }

  @override
  Widget build(BuildContext context) {
    Future<ProductLatestData> getProductData() =>
        apiServiceProduct.productLatestData(productLatestRequestModel);
    return FutureBuilder(
      future: getProductData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          latestProductData =
              ProductLatestData.fromJson(jsonDecode(jsonEncode(snapshot.data)));
          return Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: latestProductData.docs!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(4),
                  elevation: 4,
                  child: Container(
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                          width: 140,
                          child: Image.network(
                            "${AppUrl.imageBaseUrl}"
                            "${latestProductData.docs![index].images![0].url!}",
                          ),
                        ),
                        Text(latestProductData.docs![index].title_fa!),
                        Text(latestProductData.docs![index].branch_id!.name!),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text((latestProductData.docs![index].price)!
                                .toPersianDigit()
                                .seRagham()),
                            Text(' ریال')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

/*void fetchLatestProductsData(requestModelData) {
    apiServiceProduct.productLatestData(requestModelData).then((value) {
      latestProductInfo = value;
    }, onError: (err) {
      print("On Error: $err");
    }).whenComplete(
          () {
        print("Complete APi Call Latest products.");
      },
    );
  }*/
}
