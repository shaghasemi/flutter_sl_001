class LoginResponseModel {
  LoginData? data;
  List<String>? error;
  String? message;
  int? status;
  bool? success;

  LoginResponseModel(
      {this.data, this.error, this.message, this.status, this.success});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
      error:
          json['error'] != null ? new List<String>.from(json['error']) : null,
      message: json['message'],
      status: json['status'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error;
    }
    return data;
  }
}

class LoginData {
  int? v;
  String? id;
  String? createdAt;
  String? crm_id;
  String? mobile;
  int? status;
  String? token;
  int? tracking_code;
  String? type;
  String? updatedAt;
  UserId? user_id;

  LoginData(
      {this.v,
      this.id,
      this.createdAt,
      this.crm_id,
      this.mobile,
      this.status,
      this.token,
      this.tracking_code,
      this.type,
      this.updatedAt,
      this.user_id});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      crm_id: json['crm_id'],
      mobile: json['mobile'],
      status: json['status'],
      token: json['token'],
      tracking_code: json['tracking_code'],
      type: json['type'],
      updatedAt: json['updatedAt'],
      user_id:
          json['user_id'] != null ? UserId.fromJson(json['user_id']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v;
    data['_id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['crm_id'] = this.crm_id;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['token'] = this.token;
    data['tracking_code'] = this.tracking_code;
    data['type'] = this.type;
    data['updatedAt'] = this.updatedAt;
    if (this.user_id != null) {
      data['user_id'] = this.user_id!.toJson();
    }
    return data;
  }
}

class UserId {
  int? v;
  String? id;
  List<String>? address_list;
  String? birthday;
  String? city;
  Company? company;
  String? createdAt;
  String? email;
  String? family;
  String? foreign_national;
  int? gender;
  List<String>? images;
  String? lat;
  String? lon;
  String? main_address;
  String? mobile;
  String? name;
  String? national_code;
  bool? personal;
  String? postal_code;
  String? province;
  String? sosPhone;
  int? status;
  String? telephone;
  int? tracking_code;
  String? updatedAt;

  UserId(
      {this.v,
      this.id,
      this.address_list,
      this.birthday,
      this.city,
      this.company,
      this.createdAt,
      this.email,
      this.family,
      this.foreign_national,
      this.gender,
      this.images,
      this.lat,
      this.lon,
      this.main_address,
      this.mobile,
      this.name,
      this.national_code,
      this.personal,
      this.postal_code,
      this.province,
      this.sosPhone,
      this.status,
      this.telephone,
      this.tracking_code,
      this.updatedAt});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      v: json['__v'],
      id: json['_id'],
      address_list: json['address_list'] != null
          ? new List<String>.from(json['address_list'])
          : null,
      birthday: json['birthday'],
      city: json['city'],
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
      createdAt: json['createdAt'],
      email: json['email'],
      family: json['family'],
      foreign_national: json['foreign_national'],
      gender: json['gender'],
      images:
          json['images'] != null ? new List<String>.from(json['images']) : null,
      lat: json['lat'],
      lon: json['lon'],
      main_address: json['main_address'],
      mobile: json['mobile'],
      name: json['name'],
      national_code: json['national_code'],
      personal: json['personal'],
      postal_code: json['postal_code'],
      province: json['province'],
      sosPhone: json['sosPhone'],
      status: json['status'],
      telephone: json['telephone'],
      tracking_code: json['tracking_code'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v;
    data['_id'] = this.id;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['createdAt'] = this.createdAt;
    data['email'] = this.email;
    data['family'] = this.family;
    data['foreign_national'] = this.foreign_national;
    data['gender'] = this.gender;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['main_address'] = this.main_address;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['national_code'] = this.national_code;
    data['personal'] = this.personal;
    data['postal_code'] = this.postal_code;
    data['province'] = this.province;
    data['sosPhone'] = this.sosPhone;
    data['status'] = this.status;
    data['telephone'] = this.telephone;
    data['tracking_code'] = this.tracking_code;
    data['updatedAt'] = this.updatedAt;
    if (this.address_list != null) {
      data['address_list'] = this.address_list;
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images;
    }
    return data;
  }
}

class Company {
  String? address;
  String? economic_code;
  String? name;
  String? national_id;
  String? postal_code;
  String? registration_code;
  String? telephone;

  Company(
      {this.address,
      this.economic_code,
      this.name,
      this.national_id,
      this.postal_code,
      this.registration_code,
      this.telephone});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      address: json['address'],
      economic_code: json['economic_code'],
      name: json['name'],
      national_id: json['national_id'],
      postal_code: json['postal_code'],
      registration_code: json['registration_code'],
      telephone: json['telephone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['economic_code'] = this.economic_code;
    data['name'] = this.name;
    data['national_id'] = this.national_id;
    data['postal_code'] = this.postal_code;
    data['registration_code'] = this.registration_code;
    data['telephone'] = this.telephone;
    return data;
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
