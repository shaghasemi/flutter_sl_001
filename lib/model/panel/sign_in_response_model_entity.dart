import 'package:flutter_sl_001/generated/json/base/json_convert_content.dart';
import 'package:flutter_sl_001/generated/json/base/json_field.dart';

class SignInResponseModelEntity with JsonConvert<SignInResponseModelEntity> {
  late SignInResponseModelData data;
  late String message;
  late List<dynamic> error;
  late bool success;
  late int status;
}

class SignInResponseModelData with JsonConvert<SignInResponseModelData> {
  late int status;
  @JSONField(name: "_id")
  late String sId;
  @JSONField(name: "tracking_code")
  late int trackingCode;
  late String mobile;
  @JSONField(name: "user_id")
  late SignInResponseModelDataUserId userId;
  late String createdAt;
  late String updatedAt;
  @JSONField(name: "__v")
  late int iV;
  late String token;
  late String type;
}

class SignInResponseModelDataUserId
    with JsonConvert<SignInResponseModelDataUserId> {
  late SignInResponseModelDataUserIdCompany company;
  late int status;
  late String name;
  late String family;
  late int gender;
  late String email;
  @JSONField(name: "national_code")
  late String nationalCode;
  late String telephone;
  late String sosPhone;
  @JSONField(name: "postal_code")
  late String postalCode;
  @JSONField(name: "main_address")
  late String mainAddress;
  @JSONField(name: "address_list")
  late List<dynamic> addressList;
  @JSONField(name: "foreign_national")
  late String foreignNational;
  late bool personal;
  @JSONField(name: "_id")
  late String sId;
  late String mobile;
  @JSONField(name: "tracking_code")
  late int trackingCode;
  late List<dynamic> images;
  late String createdAt;
  late String updatedAt;
  @JSONField(name: "__v")
  late int iV;
}

class SignInResponseModelDataUserIdCompany
    with JsonConvert<SignInResponseModelDataUserIdCompany> {
  late String name;
  late String telephone;
  @JSONField(name: "postal_code")
  late String postalCode;
  late String address;
  @JSONField(name: "economic_code")
  late String economicCode;
  @JSONField(name: "national_id")
  late String nationalId;
  @JSONField(name: "registration_code")
  late String registrationCode;
}

class SignInRequestModel {
  String phone;
  String password;

  SignInRequestModel({
    required this.phone,
    required this.password,
  });

  SignInRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "password": password.trim(),
      };
}
