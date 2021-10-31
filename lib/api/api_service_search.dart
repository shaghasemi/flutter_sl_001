import 'package:flutter_sl_001/model/product/product_all_model.dart';
import 'package:flutter_sl_001/model/product/product_latest_model.dart';
import 'package:flutter_sl_001/model/search/product_search.dart';
import 'package:flutter_sl_001/model/product/product_single_model_old.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
// const String baseURLV1 = "https://newapi.sivanland.com/api/";
const String baseURLV1 = AppUrl.baseUrl;
// const String userRole = "customer/";
const String userRole = "guest/";

class ApiServiceSearch {
  // Get List of Products from Search - Just Data
  Future<ProductSearchData> productSearchData(
    ProductSearchRequestModel productSearchRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}search/product/paginate?"
        "str=${productSearchRequestModel.str!}&"
        "cat=${productSearchRequestModel.cat!}&"
        "br=${productSearchRequestModel.br!}&"
        "page=${productSearchRequestModel.page}&"
        "limit=${productSearchRequestModel.limit}";
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return ProductSearchData.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to Fetch Search Products');
    }
  }

// Get Latest Products
/*Future<ProductSearchResponseModel> productSearchFull(
      ProductSearchRequestModel productSearchRequestModel,
      ) async {
    String url = "$baseURLV1${userRole}search/product/paginate?"
        "str=${productSearchRequestModel.str!}&"
        "cat=${productSearchRequestModel.cat!}&"
        "br=${productSearchRequestModel.br!}&"
        "page=${productSearchRequestModel.page}&"
        "limit=${productSearchRequestModel.limit}";
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.statusCode);
    print("response.body:");
    print(jsonDecode(response.body));

    return ProductSearchResponseModel.fromJson(json.decode(response.body));
  }*/
}
