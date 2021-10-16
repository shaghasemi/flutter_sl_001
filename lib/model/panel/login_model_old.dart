/*
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
  List<String>? favorite_product;
  String? mobile;
  int? status;
  String? token;
  int? tracking_code;
  String? type;
  String? updatedAt;
  UserData? user_id;

  LoginData({
    this.v,
    this.id,
    this.createdAt,
    this.favorite_product,
    this.mobile,
    this.status,
    this.token,
    this.tracking_code,
    this.type,
    this.updatedAt,
    this.user_id,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      favorite_product: json['favorite_product'] != null
          ? new List<String>.from(json['favorite_product'])
          : null,
      mobile: json['mobile'],
      status: json['status'],
      token: json['token'],
      tracking_code: json['tracking_code'],
      type: json['type'],
      updatedAt: json['updatedAt'],
      user_id:
          json['user_id'] != null ? UserData.fromJson(json['user_id']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v;
    data['_id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['token'] = this.token;
    data['tracking_code'] = this.tracking_code;
    data['type'] = this.type;
    data['updatedAt'] = this.updatedAt;
    if (this.favorite_product != null) {
      data['favorite_product'] = this.favorite_product;
    }
    if (this.user_id != null) {
      data['user_id'] = this.user_id!.toJson();
    }
    return data;
  }
}

class UserData {
  int? v2;
  String id_2;
  int? active;
  List<String>? address_list;
  String? birthday;
  String? company_code;
  String? company_name;
  String? createdAt;
  String? economic_code;
  String? email;
  String? family;
  String? foreign_national;
  int? gender;
  String? image;
  String? main_address;
  String? mobile;
  String? name;
  String? national_code;
  String? national_id;
  bool? personal;
  String? postal_code;
  String? sosPhone;
  int? status;
  String? telephone;
  int? tracking_code;
  String? updatedAt;

  UserData(
      {this.v2,
      required this.id_2,
      this.active,
      this.address_list,
      this.birthday,
      this.company_code,
      this.company_name,
      this.createdAt,
      this.economic_code,
      this.email,
      this.family,
      this.foreign_national,
      this.gender,
      this.image,
      this.main_address,
      this.mobile,
      this.name,
      this.national_code,
      this.national_id,
      this.personal,
      this.postal_code,
      this.sosPhone,
      this.status,
      this.telephone,
      this.tracking_code,
      this.updatedAt});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      v2: json['__v'],
      id_2: json['_id'],
      active: json['active'],
      address_list: json['address_list'] != null
          ? new List<String>.from(json['address_list'])
          : null,
      birthday: json['birthday'],
      company_code: json['company_code'],
      company_name: json['company_name'],
      createdAt: json['createdAt'],
      economic_code: json['economic_code'],
      email: json['email'],
      family: json['family'],
      foreign_national: json['foreign_national'],
      gender: json['gender'],
      image: json['image'],
      main_address: json['main_address'],
      mobile: json['mobile'],
      name: json['name'],
      national_code: json['national_code'],
      national_id: json['national_id'],
      personal: json['personal'],
      postal_code: json['postal_code'],
      sosPhone: json['sosPhone'],
      status: json['status'],
      telephone: json['telephone'],
      tracking_code: json['tracking_code'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v2;
    data['_id'] = this.id_2;
    data['active'] = this.active;
    data['birthday'] = this.birthday;
    data['company_code'] = this.company_code;
    data['company_name'] = this.company_name;
    data['createdAt'] = this.createdAt;
    data['economic_code'] = this.economic_code;
    data['email'] = this.email;
    data['family'] = this.family;
    data['foreign_national'] = this.foreign_national;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['main_address'] = this.main_address;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['national_code'] = this.national_code;
    data['national_id'] = this.national_id;
    data['personal'] = this.personal;
    data['postal_code'] = this.postal_code;
    data['sosPhone'] = this.sosPhone;
    data['status'] = this.status;
    data['telephone'] = this.telephone;
    data['tracking_code'] = this.tracking_code;
    data['updatedAt'] = this.updatedAt;
    if (this.address_list != null) {
      data['address_list'] = this.address_list;
    }
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
*/
