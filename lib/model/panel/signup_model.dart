class SignupRequestModel {
  String phone;
  String password;

  SignupRequestModel({
    required this.phone,
    required this.password,
  });

  SignupRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "password": password.trim(),
      };
}

class SignupResponseModel {
  String? message;
  List<dynamic>? error;
  bool? success;
  int? status;

  SignupResponseModel({
    this.message,
    this.error,
    this.success,
    this.status,
  });

  SignupResponseModel.fromJson(dynamic json) {
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
