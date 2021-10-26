import 'package:flutter_sl_001/model/product/product_all_model.dart';
import 'package:flutter_sl_001/model/product/product_latest_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
// const String baseURLV1 = "https://newapi.sivanland.com/api/";
const String baseURLV1 = AppUrl.baseUrl;
// const String userRole = "customer/";
const String userRole = "guest/";

class ApiServiceProduct {
  // Get a Single Product by id
  Future<ProductSingleData> productSingle(
    ProductSingleRequestModel productSingleRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/info"
        "?product_id=${productSingleRequestModel.id}";
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return ProductSingleData.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to Retrieve Product Info');
    }
  }

  // Get All Products
  Future<ProductAllResponseModel> productAll(
    ProductAllRequestModel productAllRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/all";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': productAllRequestModel.token,
      },
    );
    /* if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to Login');
    }*/
    // print(UserInfoResponseModel.fromJson(json.decode(response.body)));
    return ProductAllResponseModel.fromJson(json.decode(response.body));
  }

  // Get Latest Products
  Future<ProductLatestResponseModel> productLatest(
    ProductLatestRequestModel productLatestRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/latest?"
        "num=${productLatestRequestModel.num}&"
        "cat_id=${productLatestRequestModel.cat_id}&"
        "page=${productLatestRequestModel.page!}&"
        "limit=${productLatestRequestModel.limit!}";
    print("BEfore calling Latest products:");
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.statusCode);
    print("response.body:");
    print(jsonDecode(response.body));
    /* if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to Login');
    }*/
    // print(UserInfoResponseModel.fromJson(json.decode(response.body)));
    return ProductLatestResponseModel.fromJson(json.decode(response.body));
  }

  // Get Latest Products - Just Data
  Future<ProductLatestData> productLatestData(
    ProductLatestRequestModel productLatestRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/latest?"
        "num=${productLatestRequestModel.num}&"
        "cat_id=${productLatestRequestModel.cat_id}&"
        "page=${productLatestRequestModel.page!}&"
        "limit=${productLatestRequestModel.limit!}";
    print("BEfore calling Latest products: Data");
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return ProductLatestData.fromJson((jsonDecode(response.body))['data']);
    } else {
      throw Exception('Failed to Fetch Latest Products');
    }
  }
}
