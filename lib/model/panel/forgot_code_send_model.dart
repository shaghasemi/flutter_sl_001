class ForgetCodeSendRequestModel {
  String phone;

  ForgetCodeSendRequestModel({
    required this.phone,
  });

  ForgetCodeSendRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
      };
}

class ForgetCodeSendResponseModel {
  String? data;
  String? message;
  List<dynamic>? error;
  bool? success;
  int? status;

  ForgetCodeSendResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ForgetCodeSendResponseModel.fromJson(dynamic json) {
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
