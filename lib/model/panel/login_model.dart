class LoginResponseModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  bool? success;
  int? status;

  LoginResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  LoginResponseModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    /*if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add(NewLoginResponseModel.fromJson(v));
      });
    } else {
      error = [];
    }*/
    error = json['error'];
    // error = json['error']!;
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
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

class Data {
  int? status;

  // List<String>? favoriteProduct;
  String? id;
  int? trackingCode;
  String? mobile;
  UserId? userId;

  // User_id? userId;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? token;
  String? type;

  Data({
    this.status,
    // this.favoriteProduct,
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
    /*  if (json['favorite_product'] != null) {
      favoriteProduct = [];
      json['favorite_product'].forEach((v) {
        favoriteProduct?.add(String.fromJson(v));
      });
    }*/
    // favoriteProduct = json['favoriteProduct'];
    id = json['_id'];
    trackingCode = json['tracking_code'];
    mobile = json['mobile'];
    userId = json['user_id'] != null ? UserId.fromJson(json['user_id']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    /*if (favoriteProduct != null) {
      map['favorite_product'] =
          favoriteProduct?.map((v) => v.toJson()).toList();
    }*/
    // map['favoriteProduct'] = favoriteProduct;
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

class UserId {
  String? province;
  String? city;
  int? status;
  String? name;
  String? family;
  int? gender;
  int? active;
  String? email;
  String? mainAddress;
  List<String>? addressList;
  String? nationalCode;
  String? birthday;
  String? foreignNational;
  String? postalCode;
  String? image;
  bool? personal;
  String? companyName;
  String? telephone;
  String? sosPhone;
  String? economicCode;
  String? nationalId;
  String? companyCode;
  String? id;
  String? mobile;
  int? trackingCode;
  List<Images>? images;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? lat;
  String? lon;

  UserId({
    this.province,
    this.city,
    this.status,
    this.name,
    this.family,
    this.gender,
    this.active,
    this.email,
    this.mainAddress,
    this.addressList,
    this.nationalCode,
    this.birthday,
    this.foreignNational,
    this.postalCode,
    this.image,
    this.personal,
    this.companyName,
    this.telephone,
    this.sosPhone,
    this.economicCode,
    this.nationalId,
    this.companyCode,
    this.id,
    this.mobile,
    this.trackingCode,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lat,
    this.lon,
  });

  UserId.fromJson(dynamic json) {
    province = json['province'];
    city = json['city'];
    status = json['status'];
    name = json['name'];
    family = json['family'];
    gender = json['gender'];
    active = json['active'];
    email = json['email'];
    mainAddress = json['main_address'];
    /* if (json['address_list'] != null) {
      addressList = [];
      json['address_list'].forEach((v) {
        addressList?.add(dynamic.fromJson(v));
      });
    }*/
    addressList = json['addressList'];
    nationalCode = json['national_code'];
    birthday = json['birthday'];
    foreignNational = json['foreign_national'];
    postalCode = json['postal_code'];
    image = json['image'];
    personal = json['personal'];
    companyName = json['company_name'];
    telephone = json['telephone'];
    sosPhone = json['sosPhone'];
    economicCode = json['economic_code'];
    nationalId = json['national_id'];
    companyCode = json['company_code'];
    id = json['_id'];
    mobile = json['mobile'];
    trackingCode = json['tracking_code'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['province'] = province;
    map['city'] = city;
    map['status'] = status;
    map['name'] = name;
    map['family'] = family;
    map['gender'] = gender;
    map['active'] = active;
    map['email'] = email;
    map['main_address'] = mainAddress;
    /*if (addressList != null) {
      map['address_list'] = addressList?.map((v) => v.toJson()).toList();
    }*/
    map['addressList'] = addressList;
    map['national_code'] = nationalCode;
    map['birthday'] = birthday;
    map['foreign_national'] = foreignNational;
    map['postal_code'] = postalCode;
    map['image'] = image;
    map['personal'] = personal;
    map['company_name'] = companyName;
    map['telephone'] = telephone;
    map['sosPhone'] = sosPhone;
    map['economic_code'] = economicCode;
    map['national_id'] = nationalId;
    map['company_code'] = companyCode;
    map['_id'] = id;
    map['mobile'] = mobile;
    map['tracking_code'] = trackingCode;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
}

class Images {
  String? id;
  String? type;
  String? url;

  Images({
    this.id,
    this.type,
    this.url,
  });

  Images.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['url'] = url;
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

  // This was working. The method down low is new and untested
  /*Map<String, dynamic> toJson() {
    Map<String, String> map = {
      "mobile": phone.trim(),
      "password": password.trim(),
    };
    return map;
  }*/

  LoginRequestModel.fromJson(Map<String, dynamic> json)
      : phone = json['mobile'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "mobile": phone.trim(),
        "password": password.trim(),
      };
}
