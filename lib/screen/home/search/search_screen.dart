import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_search.dart';
import 'package:flutter_sl_001/data/provider/search_provider.dart';
import 'package:flutter_sl_001/model/search/product_search.dart';
import 'package:flutter_sl_001/screen/product/widget/product_item_widget_2.dart';
import 'package:flutter_sl_001/screen/product/widget/product_single_card_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textControllerSearch = TextEditingController();
  ApiServiceSearch apiServiceSearch = ApiServiceSearch();
  ProductSearchRequestModel productSearchRequestModel =
  ProductSearchRequestModel(
      page: 1,
      limit: 1000,
      cat: '',
      br: '',
      str: 'بتن');

  @override
  void dispose() {
    textControllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) =>
        [
          SliverAppBar(
            backgroundColor: Colors.black26,
            title: TextField(
              controller: textControllerSearch,
              onChanged: (input) {
                setState(
                      () {
                    performSearch();
                  },
                );
              },
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'جستجو در سیوان لند',
              ),
            ),
            // backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
            actions: [
              textControllerSearch.text != ''
                  ? IconButton(
                // color: Colors.black,
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(
                        () {
                      textControllerSearch.text = '';
                      performSearch();
                    },
                  );
                },
              )
                  : IconButton(
                // color: Colors.black,
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(
                        () {
                      // textControllerSearch.text = '';
                      performSearch();
                    },
                  );
                },
              ),
            ],
          ),
        ],
        body: Consumer<SearchProvider>(
          builder: (context, value, child) {
            if (value.getData.total == null || value.getData.total == 0) {
              return Text('محصولی با این مشخصات پیدا نشد.');
            } else {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: value.getData.docs!.length,
                itemBuilder: (context, index) {
                  return ProductItemWidget2(
                    id: value.getData.docs![index].id!,
                    image_logo: value.getData.docs![index].images![0].url!,
                    title: value.getData.docs![index].titleFa!,
                    seller_main: value.getData.docs![index].branchId!.name!,
                    price_original: value.getData.docs![index].price!,
                  );
                  /*return ProductSingleCardWidget(
                    id: value.getData.docs![index].id!,
                    image_logo: value.getData.docs![index].images![0].url!,
                    title: value.getData.docs![index].titleFa!,
                    seller_main: value.getData.docs![index].branchId!.name!,
                    price_original: value.getData.docs![index].price!,
                  );*/
                },
              );
            }
          },
        ),
      ),
    );
  }

  List<ProductSearchDocs>? performSearch() {
    productSearchRequestModel.str = textControllerSearch.text;
    apiServiceSearch.productSearchData(productSearchRequestModel).then((value) {
      print("search value");
      return Provider.of<SearchProvider>(context, listen: false).setData(value);
    }, onError: (err) {
      print("Api Call Error: $err");
    });
  }

// TODO: Use this template for results.
// TODO: Making it a widget would be better for scaling
/*GestureDetector ProductListItem(BuildContext context, int index) {
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Card(
          elevation: 4,
          color: Colors.grey.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // height: 120,
                  width: MediaQuery.of(context).size.width / 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      "${AppUrl.imageBaseUrl}${productListInfo[index].images![0].url}",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productListInfo[index].titleFa!,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                        maxLines: 3,
                      ),
                      Text(
                        productListInfo[index].status.toString(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        productListInfo[index]
                            .price!
                            .toPersianDigit()
                            .seRagham(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('تومان'),
                      */ /*if (productListInfo[index]
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
                                              SizedBox(),*/ /*
                      */ /*Text(
                                              productListInfo[index]
                                                  .supporting
                                                  .toString(),
                                            ),*/ /*
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }*/
}
