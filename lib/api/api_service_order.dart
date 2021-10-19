import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
const String baseURLV1 = "https://newapi.sivanland.com/api/";
// const String userRole = "customer/";
const String userRole = "guest/";

class ApiServiceOrder {
  // Send Product Information and User Input to Get Price
  Future<ProcessingResponseData> processing(
    ProcessingRequestModel processingRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}order/processing";

    final response = await http.post(
      Uri.parse(url),
      body: processingRequestModel.toJson(),
    );
    print("processing Response:");
    print(json.decode(response.body)['data']);
    if (response.statusCode == 200) {
      return ProcessingResponseData.fromJson(
        json.decode(response.body)['data'],
      );
    } else {
      throw Exception('Failed to Retrieve Processing Info');
    }
  }
}
