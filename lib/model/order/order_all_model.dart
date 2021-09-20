class OrderAllResponseModel {
  List<Data>? data;
  String? message;
  bool? success;
  int? status;

  OrderAllResponseModel({this.data, this.message, this.success, this.status});

  OrderAllResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class Data {
  Province? province;
  City? city;
  int? status;
  String? transportPrice;
  String? otherPrice;
  String? id;
  int? number;
  String? address;
  String? productId;
  String? branchId;
  int? type;
  int? trackingCode;
  int? cartCode;
  String? customerId;
  int? v;
  String? createdAt;
  String? updatedAt;
  String? paymentId;

  Data(
      {this.province,
      this.city,
      this.status,
      this.transportPrice,
      this.otherPrice,
      this.id,
      this.number,
      this.address,
      this.productId,
      this.branchId,
      this.type,
      this.trackingCode,
      this.cartCode,
      this.customerId,
      this.v,
      this.createdAt,
      this.updatedAt,
      this.paymentId});

  Data.fromJson(dynamic json) {
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    status = json['status'];
    transportPrice = json['transport_price'];
    otherPrice = json['other_price'];
    id = json['_id'];
    number = json['number'];
    address = json['address'];
    productId = json['product_id'];
    branchId = json['branch_id'];
    type = json['type'];
    trackingCode = json['tracking_code'];
    cartCode = json['cart_code'];
    customerId = json['customer_id'];
    v = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    paymentId = json['payment_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (province != null) {
      map['province'] = province?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['status'] = status;
    map['transport_price'] = transportPrice;
    map['other_price'] = otherPrice;
    map['_id'] = id;
    map['number'] = number;
    map['address'] = address;
    map['product_id'] = productId;
    map['branch_id'] = branchId;
    map['type'] = type;
    map['tracking_code'] = trackingCode;
    map['cart_code'] = cartCode;
    map['customer_id'] = customerId;
    map['__v'] = v;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['payment_id'] = paymentId;
    return map;
  }
}

class City {
  String? name;
  String? lat;
  String? lng;

  City({this.name, this.lat, this.lng});

  City.fromJson(dynamic json) {
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}

class Province {
  String? name;
  String? lat;
  String? lng;

  Province({this.name, this.lat, this.lng});

  Province.fromJson(dynamic json) {
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}

class OrderAllRequestModel {
  String token;

  OrderAllRequestModel({
    required this.token,
  });

  OrderAllRequestModel.fromJson(Map<String, dynamic> json)
      : token = json['x-access-token'];

  Map<String, dynamic> toJson() => {
        "x-access-token": token.trim(),
      };
}
