import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/order/register_list_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURLV1 = AppUrl.baseUrl;
// const String userRole = "customer/";
const String userRole = "guest/";
const String userRoleCustomer = "customer/";

class ApiServiceOrder {
  // Send Product Information and User Input to Get Price
  Future<ProcessingResponseModel> processing(
    ProcessingRequestModel processingRequestModel,
  ) async {
    String processingBody = jsonEncode(processingRequestModel);

    String url = "$baseURLV1${userRole}order/processing";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Accept': '*/*'
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: processingBody,
    );
    if (response.statusCode == 200) {
      return ProcessingResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Retrieve Processing Info');
    }
  }

  // Register List for an Order
  Future<RegisterListResponseModel> registerListOrder(
      RegisterListRequestModel registerListRequestModel) async {
    String url = "${baseURLV1}${userRoleCustomer}order/Register/list";
    final response = await http.post(
      Uri.parse(url),
      body: registerListRequestModel.toJson(),
      headers: {
        'x-access-token': registerListRequestModel.token!,
      },
    );
    if (response.statusCode == 200) {
      return RegisterListResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Retrieve Processing Info');
    }
  }

}
