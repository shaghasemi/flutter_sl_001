import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/product/product_latest_model.dart';

class LatestProductsWidget extends StatefulWidget {
  const LatestProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LatestProductsWidget> createState() => _LatestProductsWidgetState();
}

class _LatestProductsWidgetState extends State<LatestProductsWidget> {
  late Future<ProductLatestData> latestProducts;
  late ProductLatestRequestModel productLatestRequestModel;


  @override
  void initState() {
    super.initState();
    // latestProducts = fetchLatestProducts();

    latestProducts = ApiServiceProduct().productLatest(productLatestRequestModel);
  }


  @override
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
  }
}

Future<ProductLatestData> fetchLatestProducts() async {
  return ProductLatestData();
}