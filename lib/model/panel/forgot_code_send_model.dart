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
  // String? data;
  String? message;
  List<String>? error;
  int? status;
  bool? success;

  ForgetCodeSendResponseModel({
    // this.data,
    this.message,
    this.error,
    this.status,
    this.success,
  });

  ForgetCodeSendResponseModel.fromJson(dynamic json) {
    // data = json['data'];
    message = json['message'];
    error = json['error'] != null ? new List<String>.from(json['error']) : null;
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    // map['data'] = data;
    map['message'] = message;
    /*if (error != null) {
      map['error'] = error?.map((v) => v.toJson()).toList();
    } else {
      map['error'] = [];
    }*/
    map['error'] = error;
    map['status'] = status;
    map['success'] = success;
    return map;
  }
}
