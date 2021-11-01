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
  // Future registerListOrder(
      RegisterListRequestModel registerListRequestModel) async {
    var body = {
      "order_list": [
        {
          "_id": "61557b53cc9eba57f01f974b",
          "pack_id": "614b00238b86328f37d4030d",
          "is_pack": true,
          "number": "15",
          "selected_property_id_list": [
            {
              "property_name": "مقاومت",
              "property_id": "614afcf08b86328f37d4024e",
              "part_id": "614affda8b86328f37d402e5"
            }
          ],
          "address": "شیراز، بلوار مدرس ،خیابان فضیلت، کوچه8",
          "lat": "lat",
          "lon": "lon",
          "province": "فارس",
          "city": "شیراز"
        },
        {
          "_id": "61501072aca32d233982d281",
          "pack_id": "6150114baca32d233982d337",
          "is_pack": true,
          "number": 2,
          "selected_property_id_list": [
            {
              "property_id": "614af2138b86328f37d3ffee",
              "part_id": "6152da8f601106628bd2e159"
            }
          ],
          "address": "شیراز، بلوار مدرس ،خیابان فضیلت، کوچه8",
          "lat": "lat",
          "lon": "lon",
          "province": "فارس",
          "city": "شیراز"
        }
      ],
      "customer_info": {
        "name": "dev",
        "family": "loper",
        "national_code": "2222222222",
        "mobile": "09398190302",
        "sosPhone": "02222222222",
        "postal_code": "2222222222",
        "personal": "false",
        "company_name": "",
        "company_telephone": "",
        "company_postal_code": "",
        "company_national_id": "222222222222",
        "company_economic_code": "",
        "company_rebuild_code": "null",
        "company_registration_code": ""
      }
    };
    var bodyJson = jsonEncode(body);
    String url = "${baseURLV1}${userRoleCustomer}order/register/list";
    Map<String, String> headers = {
      'x-access-token': registerListRequestModel.token!,
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Accept': '*/*'
    };
    // print(registerListRequestModel.token);
    print(jsonEncode(registerListRequestModel));
    final response = await http.post(
      Uri.parse(url),
      // body: jsonEncode(registerListRequestModel),
      // body: body,
      body: bodyJson,
      headers: headers,
    );
    print("response.body");
    print(response.body);
    // print(jsonEncode(response.body));
    return RegisterListResponseModel.fromJson(jsonDecode(response.body));
    /*if (response.statusCode == 200) {
      return RegisterListResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Retrieve Processing Info');
    }*/
  }
}
