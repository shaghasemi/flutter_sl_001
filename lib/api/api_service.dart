import 'dart:io';

import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_send_model.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_validate_model.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/resend_code_model.dart';
import 'package:flutter_sl_001/model/panel/signup_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
const String userRole = "customer/";

class APIService {
  // Signup
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

  // Validate Signup
  Future<ValidateSignupResponseModel> validateSignup(
      ValidateSignupRequestModel validateSignupRequestModel) async {
    String url = "${baseURLV1}${userRole}signup/code/Validation";
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
    // return ValidateSignupResponseModel.fromJson(json.decode(response.body));
  }

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

  // Resend Validation Code
  Future<ResendCodeResponseModel> resendCode(
      ResendCodeRequestModel resendCodeRequestModel) async {
    String url = "${baseURLV1}${userRole}signup/code/resend";
    final response = await http.post(
      Uri.parse(url),
      body: resendCodeRequestModel.toJson(),
    );
    /*if (response.statusCode == 200 || response.statusCode == 400) {
      var resendCodeResponse =
          ResendCodeResponseModel.fromJson(json.decode(response.body));
      return resendCodeResponse;
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to load data');
    }*/
    return ResendCodeResponseModel.fromJson(json.decode(response.body));
  }

  // Send Forgotten Validation Code
  Future<ForgetCodeSendResponseModel> forgetCodeSend(
      ForgetCodeSendRequestModel forgetCodeSendRequestModel) async {
    String url = "${baseURLV1}${userRole}forget/code/send";
    final response = await http.put(
      Uri.parse(url),
      body: forgetCodeSendRequestModel.toJson(),
    );
    /*if (response.statusCode == 200 || response.statusCode == 400) {
      var resendCodeResponse =
          ResendCodeResponseModel.fromJson(json.decode(response.body));
      return resendCodeResponse;
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to load data');
    }*/
    return ForgetCodeSendResponseModel.fromJson(json.decode(response.body));
  }

  // Validate Forgotten Validation Code
  Future<ForgetCodeValidateResponseModel> forgetCodeValidate(
      ForgetCodeValidateRequestModel forgetCodeValidateRequestModel) async {
    String url = "${baseURLV1}${userRole}forget/code/validation";
    final response = await http.put(
      Uri.parse(url),
      body: forgetCodeValidateRequestModel.toJson(),
    );
    /*if (response.statusCode == 200 || response.statusCode == 400) {
      var resendCodeResponse =
          ResendCodeResponseModel.fromJson(json.decode(response.body));
      return resendCodeResponse;
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to load data');
    }*/
    return ForgetCodeValidateResponseModel.fromJson(json.decode(response.body));
  }

  // get User Info
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

  // Get Order List
  Future<OrderAllResponseModel> orderAll(
    OrderAllRequestModel orderAllRequestModel,
  ) async {
    String url = "${baseURLV1}${userRole}order/all";
    final response = await http.get(
      Uri.parse(url),
      // body: userInfoRequestModel.toJson(),
      headers: {
        'x-access-token': orderAllRequestModel.token,
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
    return OrderAllResponseModel.fromJson(json.decode(response.body));
  }
}
