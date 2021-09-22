class ChangePasswordRequestModel {
  String phone;
  String oldPass;
  String newPass;
  String token;

  ChangePasswordRequestModel({
    required this.phone,
    required this.oldPass,
    required this.newPass,
    required this.token,
  });

  ChangePasswordRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        oldPass = json['oldPass'],
        newPass = json['newPass'],
        token = json['x-access-token'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "oldPass": oldPass.trim(),
        "newPass": newPass.trim(),
        "x-access-token": token.trim(),
      };
}

class ChangePasswordResponseModel {
  String? data;
  String? message;
  List<dynamic>? error;
  bool? success;
  int? status;

  ChangePasswordResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ChangePasswordResponseModel.fromJson(dynamic json) {
    data = json['data'];
    message = json['message'];
    error = json['error'];
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['data'] = data;
    map['message'] = message;
    /*if (error != null) {
      map['error'] = error?.map((v) => v.toJson()).toList();
    } else {
      map['error'] = [];
    }*/
    map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}
