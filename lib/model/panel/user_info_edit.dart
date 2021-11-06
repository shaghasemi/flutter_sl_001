/*
class UserInfoEditResponseModel {
  UserInfoEditResponseModel({
    // dynamic data,
    String? message,
    List<String>? error,
    bool? success,
    int? status,
  }) {
    // _data = data;
    _message = message;
    _error = error;
    _success = success;
    _status = status;
  }

  UserInfoEditResponseModel.fromJson(dynamic json) {
    // _data = json['data'];
    _message = json['message'];
    _error = json['error'] != null ? json['error'].cast<String>() : [];
    _success = json['success'];
    _status = json['status'];
  }

  // dynamic _data;
  String? _message;
  List<String>? _error;
  bool? _success;
  int? _status;

  // dynamic get data => _data;

  String? get message => _message;

  List<String>? get error => _error;

  bool? get success => _success;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['data'] = _data;
    map['message'] = _message;
    map['error'] = _error;
    map['success'] = _success;
    map['status'] = _status;
    return map;
  }
}

*/
/*
class UserInfoEditRequestModel {
  UserInfoEditRequestModel({
    String? token,
    String? name,
    String? family,
    int? gender,
    String? email,
    String? mainAddress,
    List<String>? addressList,
    int? active,
    String? nationalCode,
    String? birthday,
    String? foreignNational,
    String? postalCode,
    String? image,
    bool? personal,
    String? companyName,
    String? telephone,
    String? economicCode,
    String? nationalId,
    String? companyCode,
    String? sosPhone,
    City? city,
    Province? province,
  }) {
    _token = token;
    _name = name;
    _family = family;
    _gender = gender;
    _email = email;
    _mainAddress = mainAddress;
    _addressList = addressList;
    _active = active;
    _nationalCode = nationalCode;
    _birthday = birthday;
    _foreignNational = foreignNational;
    _postalCode = postalCode;
    _image = image;
    _personal = personal;
    _companyName = companyName;
    _telephone = telephone;
    _economicCode = economicCode;
    _nationalId = nationalId;
    _companyCode = companyCode;
    _sosPhone = sosPhone;
    _city = city;
    _province = province;
  }

  UserInfoEditRequestModel.fromJson(dynamic json) {
    _token = json['token'];
    _name = json['name'];
    _family = json['family'];
    _gender = json['gender'];
    _email = json['email'];
    _mainAddress = json['main_address'];
    _addressList =
        json['address_list'] != null ? json['address_list'].cast<String>() : [];
    _active = json['active'];
    _nationalCode = json['national_code'];
    _birthday = json['birthday'];
    _foreignNational = json['foreign_national'];
    _postalCode = json['postal_code'];
    _image = json['image'];
    _personal = json['personal'];
    _companyName = json['company_name'];
    _telephone = json['telephone'];
    _economicCode = json['economic_code'];
    _nationalId = json['national_id'];
    _companyCode = json['company_code'];
    _sosPhone = json['sosPhone'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
  }

  String? _token;
  String? _name;
  String? _family;
  int? _gender;
  String? _email;
  String? _mainAddress;
  List<String>? _addressList;
  int? _active;
  String? _nationalCode;
  String? _birthday;
  String? _foreignNational;
  String? _postalCode;
  String? _image;
  bool? _personal;
  String? _companyName;
  String? _telephone;
  String? _economicCode;
  String? _nationalId;
  String? _companyCode;
  String? _sosPhone;
  City? _city;
  Province? _province;

  String? get token => token;

  String? get name => _name;

  String? get family => _family;

  int? get gender => _gender;

  String? get email => _email;

  String? get mainAddress => _mainAddress;

  List<String>? get addressList => _addressList;

  int? get active => _active;

  String? get nationalCode => _nationalCode;

  String? get birthday => _birthday;

  String? get foreignNational => _foreignNational;

  String? get postalCode => _postalCode;

  String? get image => _image;

  bool? get personal => _personal;

  String? get companyName => _companyName;

  String? get telephone => _telephone;

  String? get economicCode => _economicCode;

  String? get nationalId => _nationalId;

  String? get companyCode => _companyCode;

  String? get sosPhone => _sosPhone;

  City? get city => _city;

  Province? get province => _province;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['name'] = _name;
    map['family'] = _family;
    map['gender'] = _gender;
    map['email'] = _email;
    map['main_address'] = _mainAddress;
    map['address_list'] = _addressList;
    map['active'] = _active;
    map['national_code'] = _nationalCode;
    map['birthday'] = _birthday;
    map['foreign_national'] = _foreignNational;
    map['postal_code'] = _postalCode;
    map['image'] = _image;
    map['personal'] = _personal;
    map['company_name'] = _companyName;
    map['telephone'] = _telephone;
    map['economic_code'] = _economicCode;
    map['national_id'] = _nationalId;
    map['company_code'] = _companyCode;
    map['sosPhone'] = _sosPhone;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_province != null) {
      map['province'] = _province?.toJson();
    }
    return map;
  }
}

class Province {
  Province({
    String? name,
    String? lat,
    String? lng,
  }) {
    _name = name;
    _lat = lat;
    _lng = lng;
  }

  Province.fromJson(dynamic json) {
    _name = json['name'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  String? _name;
  String? _lat;
  String? _lng;

  String? get name => _name;

  String? get lat => _lat;

  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}

class City {
  City({
    String? name,
    String? lat,
    String? lng,
  }) {
    _name = name;
    _lat = lat;
    _lng = lng;
  }

  City.fromJson(dynamic json) {
    _name = json['name'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  String? _name;
  String? _lat;
  String? _lng;

  String? get name => _name;

  String? get lat => _lat;

  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}
*//*


class UserInfoEditRequestModel {
  String token;
  String? name;
  String? family;
  // int? gender;
  String? email;
  String? mainAddress;

  // List<String>? addressList;
  // int? active;
  String? nationalCode;
  String? birthday;
  String? foreignNational;
  String? postalCode;

  // String? image;
  // bool? personal;
  // String? companyName;
  String? telephone;

  // String? economicCode;
  // String? nationalId;
  // String? companyCode;
  String? sosPhone;

  // City? city;
  // Province? province;

  UserInfoEditRequestModel({
    required this.token,
    this.name,
    this.family,
    // this.gender,
    this.email,
    this.mainAddress,
    // this.addressList,
    // this.active,
    this.nationalCode,
    this.birthday,
    this.foreignNational,
    this.postalCode,
    // this.image,
    // this.personal,
    // this.companyName,
    this.telephone,
    // this.economicCode,
    // this.nationalId,
    // this.companyCode,
    this.sosPhone,
    // this.city,
    // this.province;
  });

  UserInfoEditRequestModel.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        name = json['name'],
        family = json['family'],
        // gender = json['gender'],
        email = json['email'],
        mainAddress = json['main_address'],
        */
/*addressList = json['address_list'] != null
            ? json['address_list'].cast<String>()
            : [],*//*

        // active = json['active'],
        nationalCode = json['national_code'],
        birthday = json['birthday'],
        foreignNational = json['foreign_national'],
        postalCode = json['postal_code'],
        // image = json['image'],
        // personal = json['personal'],
        // companyName = json['company_name'],
        telephone = json['telephone'],
        // economicCode = json['economic_code'],
        // nationalId = json['national_id'],
        // companyCode = json['company_code'],
        sosPhone = json['sosPhone'];

  */
/*city = json['city'] != null ? City.fromJson(json['city']) : null,
        province =
        json['province'] != null ? Province.fromJson(json['province']) : null;*//*


  Map<String, dynamic> toJson() => {
        'token': token.trim(),
        'name': name!.trim(),
        'family': family!.trim(),
        // 'gender': gender,
        'email': email!.trim(),
        'main_address': mainAddress!.trim(),
        // 'address_list': addressList,
        // 'active': active,
        'national_code': nationalCode!.trim(),
        'birthday': birthday!.trim(),
        'foreign_national': foreignNational!.trim(),
        'postal_code': postalCode!.trim(),
        // 'image': image!.trim(),
        // 'personal': personal,
        // 'company_name': companyName!.trim(),
        'telephone': telephone!.trim(),
        // 'economic_code': economicCode!.trim(),
        // 'national_id': nationalId!.trim(),
        // 'company_code': companyCode!.trim(),
        'sosPhone': sosPhone!.trim(),
        */
/*if (city != null) {
      'city':city?.toJson()!.trim(),
    }
    if (province != null) {
      'province':province?.toJson()!.trim(),
    }*//*

      };
}
*/
/*
class Province {
  Province({
    String? name,
    String? lat,
    String? lng,
  }) {
    _name = name;
    _lat = lat;
    _lng = lng;
  }

  Province.fromJson(dynamic json) {
    _name = json['name'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  String? _name;
  String? _lat;
  String? _lng;

  String? get name => _name;

  String? get lat => _lat;

  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}

class City {
  City({
    String? name,
    String? lat,
    String? lng,
  }) {
    _name = name;
    _lat = lat;
    _lng = lng;
  }

  City.fromJson(dynamic json) {
    _name = json['name'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  String? _name;
  String? _lat;
  String? _lng;

  String? get name => _name;

  String? get lat => _lat;

  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }*/

