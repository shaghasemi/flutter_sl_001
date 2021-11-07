class UserInfoEditResponseModel {
  UserInfoEditResponseModel({
    // this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  UserInfoEditResponseModel.fromJson(dynamic json) {
    // data = json['data'];
    message = json['message'];
    error = json['error'] != null ? json['error'].cast<String>() : [];
    success = json['success'];
    status = json['status'];
  }

  // dynamic data;
  String? message;
  List<String>? error;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['data'] = data;
    map['message'] = message;
    map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}
