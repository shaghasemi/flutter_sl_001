/*import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_search.dart';
import 'package:flutter_sl_001/model/product/product_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  ApiServiceSearch apiServiceSearch = ApiServiceSearch();
  late Future<ProductSearchData> searchedProducts;
  late ProductSearchRequestModel productSearchRequestModel;
  late ProductSearchData searchedProductData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productSearchRequestModel.page = 1;
    productSearchRequestModel.limit = 1000;
  }

  @override
  Widget build(BuildContext context) {
    */
/*Future<ProductSearchData> getProductSearchData() =>
        apiServiceSearch.productSearchData(productSearchRequestModel);*//*

    return Column(
      children: [
        // Search Input Section
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(8),
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.search),
                    // Perform Search
                    // Use Provider and Consumer to update search result field ???
                    // Use FutureBuilder to update search result field
                    onPressed: () {
                      Future<ProductSearchData> getProductSearchData() =>
                          apiServiceSearch
                              .productSearchData(productSearchRequestModel);
                      */
/*setState(() {
                        Future<ProductSearchData> getProductSearchData() =>
                            apiServiceSearch.productSearchData(
                                productSearchRequestModel);
                      });*//*

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 2,
                  ),
                  child: TextField(
                    onChanged: (input) {
                      productSearchRequestModel.str = input.toString();
                    },
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 24,
                      color: Colors.greenAccent,
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
        ),

        // Search Result Section
        Container(
          child: SingleChildScrollView(
            child: SafeArea(
              child: FutureBuilder(
                future: getProductSearchData(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(itemBuilder: itemBuilder);
                },
              ),
              // child: ListView.builder(itemBuilder: itemBuilder),
            ),
          ),
        )
      ],
    );
  }
}
*/