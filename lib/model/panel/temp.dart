/*
class paymentInitResponseModel {
  paymentInitResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  paymentInitResponseModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? json['error'].cast<String>() : [];
    success = json['success'];
    status = json['status'];
  }

  Data? data;
  String? message;
  List<String>? error;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class Data {
  Data({
    this.form,
  });

  Data.fromJson(dynamic json) {
    form = json['form'];
  }

  String? form;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['form'] = form;
    return map;
  }
}
*/
