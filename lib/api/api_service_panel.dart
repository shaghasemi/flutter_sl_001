import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/model/panel/change_password_model.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_send_model.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_validate_model.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/panel_order_model.dart';
import 'package:flutter_sl_001/model/panel/payment_init_model.dart';
import 'package:flutter_sl_001/model/panel/resend_code_model.dart';
import 'package:flutter_sl_001/model/panel/signup_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_edit.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum Status {
  notLoggedIn,
  notRegistered,
  notValidated,
  loggedIn,
  registered,
  validated,
  authenticating,
  registering,
  loggedOut
}

// const String baseURLV1 = "http://mobile.sivanland.com/api/mobile/v1/";
// const String baseURLV1 = "https://newapi.sivanland.com/api/";
const String baseURLV1 = AppUrl.baseUrl;
const String userRole = "customer/";

class APIServicePanel extends ChangeNotifier {
  Status _registeredStatus = Status.notRegistered;
  Status _loggedInStatus = Status.notLoggedIn;
  Status _validatedStatus = Status.notValidated;

  Status get loggedInStatus => _loggedInStatus;

  Status get registeredStatus => _registeredStatus;

  Status get validatedStatus => _validatedStatus;

  // Signup
  Future<SignupResponseModel> signup(
      SignupRequestModel signupRequestModel) async {
    String url = "${baseURLV1}${userRole}signup";
    final response = await http.post(
      Uri.parse(url),
      body: signupRequestModel.toJson(),
    );
    if (response.statusCode == 200) {
      _registeredStatus = Status.registered;
      var signupResponse =
          SignupResponseModel.fromJson(json.decode(response.body));
      return signupResponse;
    } else {
      _registeredStatus = Status.registered;
      throw Exception('Failed to Register');
    }
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
      _validatedStatus = Status.validated;
      var validateSignupResponse =
          ValidateSignupResponseModel.fromJson(json.decode(response.body));
      return validateSignupResponse;
    } else {
      _validatedStatus = Status.notValidated;
      throw Exception('Failed to Validate');
    }
  }

  // Login
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "${baseURLV1}${userRole}signin";
    final response = await http.post(
      Uri.parse(url),
      body: loginRequestModel.toJson(),
    );
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Login');
    }
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

  // Change Password
  Future<ChangePasswordResponseModel> changePassword(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    String url = "${baseURLV1}${userRole}password/changer";
    final response = await http.put(
      Uri.parse(url),
      body: changePasswordRequestModel.toJson(),
      headers: {
        'x-access-token': changePasswordRequestModel.token,
      },
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
    return ChangePasswordResponseModel.fromJson(json.decode(response.body));
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

  // Get User Info
  Future<UserInfoResponseModel> getUserInfo(
    UserInfoRequestModel userInfoRequestModel,
  ) async {
    String url = "${baseURLV1}${userRole}info";
    final response = await http.get(
      Uri.parse(url),
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
    return UserInfoResponseModel.fromJson(json.decode(response.body));
  }

  // Edit User Info
  Future<UserInfoEditResponseModel> editUserInfo(
    UserInfoEditRequestModel userInfoEditRequestModel,
  ) async {
    String url = "${baseURLV1}${userRole}editor";
    final response = await http.put(
      Uri.parse(url),
      body: userInfoEditRequestModel.toJson(),
      headers: {
        'x-access-token': userInfoEditRequestModel.token,
      },
    );
    /* if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Error from API Service");
      // return LoginResponseErrorModel.fromJson(json.decode(response.body));
      throw Exception('Failed to Login');
    }*/
    return UserInfoEditResponseModel.fromJson(json.decode(response.body));
  }

  // Get List of Orders
  Future<PanelOrderResponseData> getOrderData(
    PanelOrderRequestModel panelOrderRequestModel,
  ) async {
    String url = "$baseURLV1${userRole}order/group/cart/paginate?"
        "page=${panelOrderRequestModel.page}&"
        "limit=${panelOrderRequestModel.limit}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-access-token': panelOrderRequestModel.token,
      },
    );
    if (response.statusCode == 200) {
      return PanelOrderResponseData.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to Fetch Order Records');
    }
  }

  // Get Proforma
  Future getProforma() async {
    String url = "${baseURLV1}guest/pdf/prefactor?code=123456";
    final response = await http.get(Uri.parse(url));
    return;
  }

  // Initiate Payment
  Future<PaymentInitResponseModel> initPayment(
      PaymentInitRequestModel paymentInitRequestModel) async {
    String url = "$baseURLV1${userRole}payment/init?"
        "payment_id=${paymentInitRequestModel.paymentId}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-access-token': paymentInitRequestModel.token!,
      },
    );
    if (response.statusCode == 200) {
      return PaymentInitResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Initiate Payment');
    }
  }
}
