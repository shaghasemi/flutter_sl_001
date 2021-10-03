import 'package:flutter_sl_001/model/category/category_all_model.dart';
import 'package:flutter_sl_001/model/category/category_main.dart';
import 'package:flutter_sl_001/model/category/category_sub_1.dart';
import 'package:flutter_sl_001/model/category/category_sub_2.dart';
import 'package:flutter_sl_001/model/category/product_list_by_category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
const String userRole = "customer/";

class ApiServiceCategory {
  // Get All Categories (All Levels)
  Future<CategoryAllResponseModel> categoryAll(
    CategoryAllRequestModel categoryAllRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/all/list";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': categoryAllRequestModel.token,
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
    return CategoryAllResponseModel.fromJson(json.decode(response.body));
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
    /* if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to Login');
    }*/
    // print(UserInfoResponseModel.fromJson(json.decode(response.body)));
    return CategoryMainResponseModel.fromJson(json.decode(response.body));
  }

// Get Level One Categories
  Future<CategorySubOneResponseModel> categorySubOne(
    CategorySubOneRequestModel categorySubOneRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/sub/one/list/"
        "status=${categorySubOneRequestModel.status}&"
        "parent_id=${categorySubOneRequestModel.parentId}";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': categorySubOneRequestModel.token,
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
    return CategorySubOneResponseModel.fromJson(json.decode(response.body));
  }

// Get Level Two Categories
  Future<CategorySubTwoResponseModel> categoryTwoOne(
    CategorySubTwoRequestModel categorySubTwoRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}category/sub/two/list/"
        "status=${categorySubTwoRequestModel.status}&"
        "parent_id=${categorySubTwoRequestModel.parentId}";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': categorySubTwoRequestModel.token,
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
    return CategorySubTwoResponseModel.fromJson(json.decode(response.body));
  }

  // Get Products in a Category
  Future<ProductListByCategoryResponseModel> productByCategory(
    ProductListByCategoryRequestModel productListByCategoryRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/find/category"
        "?category_id=${productListByCategoryRequestModel.categoryId}";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': productListByCategoryRequestModel.token,
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
    return ProductListByCategoryResponseModel.fromJson(
        json.decode(response.body));
  }
}
