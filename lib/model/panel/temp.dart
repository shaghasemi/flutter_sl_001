class Temp {
  Temp({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  Temp.fromJson(dynamic json) {
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
    this.status,
    this.id,
    this.trackingCode,
    this.mobile,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.type,
  });

  Data.fromJson(dynamic json) {
    status = json['status'];
    id = json['_id'];
    trackingCode = json['tracking_code'];
    mobile = json['mobile'];
    userId = json['user_id'] != null ? User_id.fromJson(json['userId']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    token = json['token'];
    type = json['type'];
  }

  int? status;
  String? id;
  int? trackingCode;
  String? mobile;
  User_id? userId;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? token;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['_id'] = id;
    map['tracking_code'] = trackingCode;
    map['mobile'] = mobile;
    if (userId != null) {
      map['user_id'] = userId?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['token'] = token;
    map['type'] = type;
    return map;
  }
}

class User_id {
  User_id({
    this.company,
    this.status,
    this.name,
    this.family,
    this.gender,
    this.email,
    this.nationalCode,
    this.telephone,
    this.sosPhone,
    this.postalCode,
    this.mainAddress,
    this.addressList,
    this.foreignNational,
    this.personal,
    this.id,
    this.mobile,
    this.trackingCode,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  User_id.fromJson(dynamic json) {
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    status = json['status'];
    name = json['name'];
    family = json['family'];
    gender = json['gender'];
    email = json['email'];
    nationalCode = json['national_code'];
    telephone = json['telephone'];
    sosPhone = json['sosPhone'];
    postalCode = json['postal_code'];
    mainAddress = json['main_address'];
    addressList =
        json['address_list'] != null ? json['address_list'].cast<String>() : [];
    foreignNational = json['foreign_national'];
    personal = json['personal'];
    id = json['_id'];
    mobile = json['mobile'];
    trackingCode = json['tracking_code'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Company? company;
  int? status;
  String? name;
  String? family;
  int? gender;
  String? email;
  String? nationalCode;
  String? telephone;
  String? sosPhone;
  String? postalCode;
  String? mainAddress;
  List<String>? addressList;
  String? foreignNational;
  bool? personal;
  String? id;
  String? mobile;
  int? trackingCode;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['status'] = status;
    map['name'] = name;
    map['family'] = family;
    map['gender'] = gender;
    map['email'] = email;
    map['national_code'] = nationalCode;
    map['telephone'] = telephone;
    map['sosPhone'] = sosPhone;
    map['postal_code'] = postalCode;
    map['main_address'] = mainAddress;
    map['address_list'] = addressList;
    map['foreign_national'] = foreignNational;
    map['personal'] = personal;
    map['_id'] = id;
    map['mobile'] = mobile;
    map['tracking_code'] = trackingCode;
    map['images'] = images;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Company {
  Company({
    this.name,
    this.telephone,
    this.postalCode,
    this.address,
    this.economicCode,
    this.nationalId,
    this.registrationCode,
  });

  Company.fromJson(dynamic json) {
    name = json['name'];
    telephone = json['telephone'];
    postalCode = json['postal_code'];
    address = json['address'];
    economicCode = json['economic_code'];
    nationalId = json['national_id'];
    registrationCode = json['registration_code'];
  }

  String? name;
  String? telephone;
  String? postalCode;
  String? address;
  String? economicCode;
  String? nationalId;
  String? registrationCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['telephone'] = telephone;
    map['postal_code'] = postalCode;
    map['address'] = address;
    map['economic_code'] = economicCode;
    map['national_id'] = nationalId;
    map['registration_code'] = registrationCode;
    return map;
  }
}

class LoginRequestModel {
  String phone;
  String password;

  LoginRequestModel({
    required this.phone,
    required this.password,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "password": password.trim(),
      };
}
