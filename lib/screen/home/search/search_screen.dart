import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_search.dart';
import 'package:flutter_sl_001/model/search/product_search.dart';
import 'package:flutter_sl_001/provider_test/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiServiceSearch apiServiceSearch = ApiServiceSearch();
  // late Future<ProductSearchData> searchedProducts;
  ProductSearchRequestModel productSearchRequestModel =
      ProductSearchRequestModel(page: 1, limit: 1000, cat: '', br: '',str: 'بتن');
  // late ProductSearchData searchedProductData;

  @override
  void initState() {
    super.initState();
    // productSearchRequestModel = productSearchRequestModel.page = 1;
    // productSearchRequestModel.limit = 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Input Section
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print('call for search');
                    apiServiceSearch
                        .productSearchData(productSearchRequestModel)
                        .then((value) {
                      print("search value");
                      return Provider.of<SearchProvider>(context, listen: false)
                          .setData(value);
                    }, onError: (err) {
                      print("Api Call Error: $err");
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 2,
                ),
                child: Container(
                  width: 200,
                  height: 50,
                  child: TextField(
                    onChanged: (input) {
                      productSearchRequestModel.str = input;
                    },
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 24,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        // Search Result Section
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Consumer<SearchProvider>(
            builder: (context, value, child) {
              if (/*value.getData.total!.notnull! &&*/ value.getData.total == 0) {
                return Text('محصولی با این مشخصات پیدا نشد.');
              } else {
                return SafeArea(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: value.getData.docs!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 200,
                        height: 50,
                        child: Text(value.getData.docs![index].titleFa!),
                        // child: Text('Search Result'),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
