class ForgetCodeValidateRequestModel {
  String phone;
  String recCode;
  String newPass;

  ForgetCodeValidateRequestModel({
    required this.phone,
    required this.recCode,
    required this.newPass,
  });

  ForgetCodeValidateRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        recCode = json['recCode'],
        newPass = json['newPass'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "recCode": recCode.trim(),
        "newPass": newPass.trim(),
      };
}

class ForgetCodeValidateResponseModel {
  String? data;
  String? message;
  List<dynamic>? error;
  bool? success;
  int? status;

  ForgetCodeValidateResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ForgetCodeValidateResponseModel.fromJson(dynamic json) {
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
