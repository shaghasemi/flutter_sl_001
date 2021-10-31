class PaymentInitResponseModel {
  PaymentInitResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  PaymentInitResponseModel.fromJson(dynamic json) {
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

class PaymentInitRequestModel {
  PaymentInitRequestModel({
    this.paymentId,
    this.token,
  });

  PaymentInitRequestModel.fromJson(dynamic json) {
    paymentId = json['payment_id'];
    token = json['x-access-token'];
  }

  String? paymentId;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_id'] = paymentId;
    map['x-access-token'] = token;
    return map;
  }
}
