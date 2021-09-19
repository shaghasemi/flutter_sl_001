import 'dart:io';

import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/signup_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
const String userRole = "customer/";

class APIService {
  // Login
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "${baseURLV1}${userRole}signin";
    final response = await http.post(
      Uri.parse(url),
      body: loginRequestModel.toJson(),
    );
    /* if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to Login');
    }*/
    return LoginResponseModel.fromJson(json.decode(response.body));
  }

  Future<SignupResponseModel> signup(
      SignupRequestModel signupRequestModel) async {
    String url = "${baseURLV1}${userRole}signup";
    print(url);
    final response = await http.post(
      Uri.parse(url),
      body: signupRequestModel.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var signupResponse =
          SignupResponseModel.fromJson(json.decode(response.body));
      // if (signupResponse.status == 200){}
      return signupResponse;
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to load data');
    }
    // return SignupResponseModel.fromJson(json.decode(response.body));
  }

  Future<ValidateSignupResponseModel> validateSignup(
      ValidateSignupRequestModel validateSignupRequestModel) async {
    String url = "${baseURLV1}${userRole}signup/code/Validation";
    print(url);
    final response = await http.post(
      Uri.parse(url),
      body: validateSignupRequestModel.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var validateSignupResponse =
          ValidateSignupResponseModel.fromJson(json.decode(response.body));
      return validateSignupResponse;
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to load data');
    }
    // return SignupResponseModel.fromJson(json.decode(response.body));
  }

  Future<UserInfoResponseModel> userInfo(
      UserInfoRequestModel userInfoRequestModel) async {
    String url = "${baseURLV1}${userRole}info";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': userInfoRequestModel.token,
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
    return UserInfoResponseModel.fromJson(json.decode(response.body));
  }
}
