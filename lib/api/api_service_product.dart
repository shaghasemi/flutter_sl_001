import 'package:flutter_sl_001/model/category/category_all_model.dart';
import 'package:flutter_sl_001/model/category/category_main.dart';
import 'package:flutter_sl_001/model/category/category_sub_1.dart';
import 'package:flutter_sl_001/model/category/category_sub_2.dart';
import 'package:flutter_sl_001/model/category/product_list_by_category_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
const String userRole = "customer/";

class ApiServiceCategory {
  // Get a Single Product by id
  Future<ProductSingleResponseModel> productSingle(
    ProductSingleRequestModel productSingleRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}product/find/one"
        "?product_id=${productSingleRequestModel.id}";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': productSingleRequestModel.token,
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
    return ProductSingleResponseModel.fromJson(json.decode(response.body));
  }
}
