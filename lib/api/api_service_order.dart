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
  Future<ProcessingResponseModel> processing(
    ProcessingRequestModel processingRequestModel,
    // List<ProcessingRequestOrderList> processingRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}order/processing";
    // print(jsonEncode(processingRequestModel));

    final response = await http.post(
      Uri.parse(url),
      // body: processingRequestModel.toJson(),
      // body: {'order_list': jsonEncode(processingRequestModel)},
      body: processingRequestModel.toJson(),
    );
    // print("processing Response:");
    // print(jsonDecode(response.body));
    // print(response.statusCode);
    // print("json.decode(response.body)['data']");
    // print(json.decode(response.body)['data']);
    if (response.statusCode == 200) {
      return ProcessingResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to Retrieve Processing Info');
    }
  }
}
