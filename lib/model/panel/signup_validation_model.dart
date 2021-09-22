
class ValidateSignupRequestModel {
  String phone;
  String code;

  ValidateSignupRequestModel({
    required this.phone,
    required this.code,
  });

  // This was working. The method down low is new and untested
  /*Map<String, dynamic> toJson() {
    Map<String, String> map = {
      "mobile": phone.trim(),
      "password": password.trim(),
    };
    return map;
  }*/

  ValidateSignupRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "code": code.trim(),
      };
}

class ValidateSignupResponseModel {
  String? message;
  List<dynamic>? error;
  bool? success;
  int? status;

  ValidateSignupResponseModel({
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ValidateSignupResponseModel.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    if (error != null) {
      map['error'] = error?.map((v) => v.toJson()).toList();
    } else {
      map['error'] = [];
    }
    // map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}
