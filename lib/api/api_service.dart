import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "http://mobile.sivanland.com/api/mobile/v1/customer/signin";
    final response =
        await http.post(Uri.parse(url), body: loginRequestModel.toJson());
    /*if (response.statusCode == 200 || response.statusCode == 400) {
      return NewLoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to load data');
    }    }
*/
    return LoginResponseModel.fromJson(json.decode(response.body));
  }
}
