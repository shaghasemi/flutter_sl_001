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
  String dropdownValue = 'One';
  int ratioUnit = 1;

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
                elevation: 24,
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  PopupMenuButton<int>(
                    onSelected: (item) => handleClick(item),
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.compare,
                              color: Colors.black,
                            ),
                            Text('مقایسه'),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        height: 30,
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            Text('به اشتراک گذاری'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
                  Text(productSingleData.titleFa!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text('حداقل سفارش:'),
                          Text(productSingleData.minOrder.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text('حداکثر سفارش:'),
                          Text(productSingleData.maxOrder.toString()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Select Packing if available
                  productSingleData.packList!.length > 0
                      ? DropdownButton<String>(
                          items: productSingleData.packList!
                              .map<DropdownMenuItem<String>>((PackList object) {
                            return DropdownMenuItem<String>(
                              value: object.ratioUnit,
                              child: Text(object.name!),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        )
                      : SizedBox(),

                  // Discount based on order quantity
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text('درصد تخفیف به ازای بازه ی خرید'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            productSingleData.priceRatioRangeList!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text('از '),
                              Text(productSingleData
                                  .priceRatioRangeList![index].start
                                  .toString()),
                              Text(' تا '),
                              Text(productSingleData
                                  .priceRatioRangeList![index].end
                                  .toString()),
                              Text(productSingleData.unit.toString()),
                              Text(productSingleData
                                  .priceRatioRangeList![index].ratioPrice
                                  .toString()),
                              Text(' درصد'),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(productSingleData.titleFa!),
                  SizedBox(height: 20),
                  Text(productSingleData.titleFa!),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<CartProductList>(context, listen: false)
                            .addProductToCart(
                      // id: productInfo.id.toString(),
                      id: productSingleData.id!,
                    ),
                    child: Text("افزودن به سبد خرید"),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: 180,
            width: 180,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  void addToCart() {}
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
  }
}
