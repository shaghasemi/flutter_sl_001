class UserInfoEditRequestModel {
  UserInfoEditRequestModel({
    this.token,
    this.name,
    this.family,
    this.gender,
    this.email,
    this.mainAddress,
    // this.addressList,
    this.nationalCode,
    this.birthday,
    this.telephone,
    this.sosPhone,
    this.postalCode,
    this.lat,
    this.lon,
    this.province,
    this.city,
    this.images,
    this.foreignNational,
    this.personal,
    // this.company,
  });

  UserInfoEditRequestModel.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    family = json['family'];
    gender = json['gender'];
    email = json['email'];
    mainAddress = json['main_address'];
    /*addressList =
        json['address_list'] != null ? json['address_list'].cast<String>() : [];*/
    nationalCode = json['national_code'];
    birthday = json['birthday'];
    telephone = json['telephone'];
    sosPhone = json['sosPhone'];
    postalCode = json['postal_code'];
    lat = json['lat'];
    lon = json['lon'];
    province = json['province'];
    city = json['city'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    foreignNational = json['foreign_national'];
    personal = json['personal'];
    /*company =
        json['company'] != null ? UserInfoEditRequestCompany.fromJson(json['company']) : null;*/
  }

  String? token;
  String? name;
  String? family;
  String? gender;
  String? email;
  String? mainAddress;

  // List<String>? addressList;
  String? nationalCode;
  String? birthday;
  String? telephone;
  String? sosPhone;
  String? postalCode;
  String? lat;
  String? lon;
  String? province;
  String? city;
  List<Images>? images;
  String? foreignNational;
  String? personal;

  // UserInfoEditRequestCompany? company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    map['family'] = family;
    map['gender'] = gender;
    map['email'] = email;
    map['main_address'] = mainAddress;
    // map['address_list'] = addressList;
    map['national_code'] = nationalCode;
    map['birthday'] = birthday;
    map['telephone'] = telephone;
    map['sosPhone'] = sosPhone;
    map['postal_code'] = postalCode;
    map['lat'] = lat;
    map['lon'] = lon;
    map['province'] = province;
    map['city'] = city;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['foreign_national'] = foreignNational;
    map['personal'] = personal;
    /* if (company != null) {
      map['company'] = company?.toJson();
    }*/
    return map;
  }
}

class UserInfoEditRequestCompany {
  UserInfoEditRequestCompany({
    this.name,
    this.telephone,
    this.postalCode,
    this.address,
    this.economicCode,
    this.nationalId,
    this.registrationCode,
  });

  UserInfoEditRequestCompany.fromJson(dynamic json) {
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

class Images {
  Images({
    this.type,
    this.url,
  });

  Images.fromJson(dynamic json) {
    type = json['type'];
    url = json['url'];
  }

  String? type;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['url'] = url;
    return map;
  }
}
