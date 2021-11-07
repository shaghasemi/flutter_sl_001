import 'package:flutter_sl_001/model/category/category_all_model.dart';
import 'package:flutter_sl_001/model/category/category_all_model_saeed.dart';
import 'package:flutter_sl_001/model/category/category_main.dart';
import 'package:flutter_sl_001/model/category/category_sub_1.dart';
import 'package:flutter_sl_001/model/category/category_sub_2.dart';
import 'package:flutter_sl_001/model/category/product_by_category_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
// const String baseURLV1 = "https://newapi.sivanland.com/api/";
const String baseURLV1 = AppUrl.baseUrl;
// const String userRole = "customer/";
const String userRole = "guest/";

class ApiServiceCategory {
  // Get All Categories (All Levels)
  Future<CategoryAllModelSaeed> categorySaeed(
      // CategoryAllRequestModel categoryAllRequestModel,
      ) async {
    String url = "${baseURLV1}commission/category/tree";
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return CategoryAllModelSaeed.fromJson(json.decode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }

  Future<CategoryAllResponseModel> categoryAll(
    CategoryAllRequestModel categoryAllRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/all/list";
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return CategoryAllResponseModel.fromJson(json.decode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }

// Get Level Zero Categories
  Future<CategoryMainResponseModel> categoryMain(
    CategoryMainRequestModel categoryMainRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/main/list";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': categoryMainRequestModel.token,
      },
    );
    if (response.statusCode == 200) {
      return CategoryMainResponseModel.fromJson(json.decode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }

// Get Level One Categories
  Future<CategorySubOneResponseModel> categorySubOne(
    CategorySubOneRequestModel categorySubOneRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/sub/one/list?"
        "status=${categorySubOneRequestModel.status}&"
        "parent_id=${categorySubOneRequestModel.parentId}";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': categorySubOneRequestModel.token,
      },
    );
    if (response.statusCode == 200) {
      return CategorySubOneResponseModel.fromJson(json.decode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }

// Get Level Two Categories
  Future<CategorySubTwoResponseModel> categorySubTwo(
    CategorySubTwoRequestModel categorySubTwoRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/sub/two/list?"
        "status=${categorySubTwoRequestModel.status}&"
        "parent_id=${categorySubTwoRequestModel.parentId}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return CategorySubTwoResponseModel.fromJson(json.decode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }

  // Get Products in a Category
  Future<ProductListByCategoryResponseModel> productByCategory(
    ProductListByCategoryRequestModel productListByCategoryRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/find/category?"
        "category_id=${productListByCategoryRequestModel.categoryId}";
    print("jsonEncode(productListByCategoryRequestModel)");
    print(jsonEncode(productListByCategoryRequestModel));
    final response = await http.get(
      Uri.parse(url),
    );
    // print("jsonEncode(response.body)");
    // print(jsonEncode(response.body));
   /* print(
        ProductListByCategoryResponseModel.fromJson(json.decode(response.body))
            .status);*/
    if (response.statusCode == 200) {
      return ProductListByCategoryResponseModel.fromJson(
          json.decode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }
}
