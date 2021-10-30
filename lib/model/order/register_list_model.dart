class RegisterListResponseModel {
  RegisterListResponseModel({
    this.data,
    this.message,
    // this.error,
    this.success,
    this.status,
  });

  RegisterListResponseModel.fromJson(dynamic json) {
    data = json['data'];
    message = json['message'];
    // error = json['error'] != null ? json['error'].cast<String>() : [];
    success = json['success'];
    status = json['status'];
  }

  bool? data;
  String? message;
  // List<String>? error;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['message'] = message;
    // map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class RegisterListRequestModel {
  RegisterListRequestModel({
    this.orderList,
    this.customerInfo,
    this.token,
  });

  RegisterListRequestModel.fromJson(dynamic json) {
    if (json['order_list'] != null) {
      orderList = [];
      json['order_list'].forEach((v) {
        orderList?.add(Order_list.fromJson(v));
      });
    }
    customerInfo = json['customer_info'] != null
        ? Customer_info.fromJson(json['customerInfo'])
        : null;
    token = json['token'];
  }

  List<Order_list>? orderList;
  Customer_info? customerInfo;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orderList != null) {
      map['order_list'] = orderList?.map((v) => v.toJson()).toList();
    }
    if (customerInfo != null) {
      map['customer_info'] = customerInfo?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class Customer_info {
  Customer_info({
    this.name,
    this.family,
    this.nationalCode,
    this.mobile,
    this.sosPhone,
    this.postalCode,
    this.personal,
    this.companyName,
    this.companyTelephone,
    this.companyPostalCode,
    this.companyNationalId,
    this.companyEconomicCode,
    this.companyRebuildCode,
    this.companyRegistrationCode,
  });

  Customer_info.fromJson(dynamic json) {
    name = json['name'];
    family = json['family'];
    nationalCode = json['national_code'];
    mobile = json['mobile'];
    sosPhone = json['sosPhone'];
    postalCode = json['postal_code'];
    personal = json['personal'];
    companyName = json['company_name'];
    companyTelephone = json['company_telephone'];
    companyPostalCode = json['company_postal_code'];
    companyNationalId = json['company_national_id'];
    companyEconomicCode = json['company_economic_code'];
    companyRebuildCode = json['company_rebuild_code'];
    companyRegistrationCode = json['company_registration_code'];
  }

  String? name;
  String? family;
  String? nationalCode;
  String? mobile;
  String? sosPhone;
  String? postalCode;
  bool? personal;
  String? companyName;
  String? companyTelephone;
  String? companyPostalCode;
  String? companyNationalId;
  String? companyEconomicCode;
  String? companyRebuildCode;
  String? companyRegistrationCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['family'] = family;
    map['national_code'] = nationalCode;
    map['mobile'] = mobile;
    map['sosPhone'] = sosPhone;
    map['postal_code'] = postalCode;
    map['personal'] = personal;
    map['company_name'] = companyName;
    map['company_telephone'] = companyTelephone;
    map['company_postal_code'] = companyPostalCode;
    map['company_national_id'] = companyNationalId;
    map['company_economic_code'] = companyEconomicCode;
    map['company_rebuild_code'] = companyRebuildCode;
    map['company_registration_code'] = companyRegistrationCode;
    return map;
  }
}

class Order_list {
  Order_list({
    this.id,
    this.packId,
    this.isPack,
    this.number,
    this.selectedPropertyIdList,
    this.address,
    this.lat,
    this.lon,
    this.province,
    this.city,
  });

  Order_list.fromJson(dynamic json) {
    id = json['_id'];
    packId = json['pack_id'];
    isPack = json['is_pack'];
    number = json['number'];
    if (json['selected_property_id_list'] != null) {
      selectedPropertyIdList = [];
      json['selected_property_id_list'].forEach((v) {
        selectedPropertyIdList?.add(Selected_property_id_list.fromJson(v));
      });
    }
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    province = json['province'];
    city = json['city'];
  }

  String? id;
  String? packId;
  bool? isPack;
  int? number;
  List<Selected_property_id_list>? selectedPropertyIdList;
  String? address;
  double? lat;
  double? lon;
  String? province;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['pack_id'] = packId;
    map['is_pack'] = isPack;
    map['number'] = number;
    if (selectedPropertyIdList != null) {
      map['selected_property_id_list'] =
          selectedPropertyIdList?.map((v) => v.toJson()).toList();
    }
    map['address'] = address;
    map['lat'] = lat;
    map['lon'] = lon;
    map['province'] = province;
    map['city'] = city;
    return map;
  }
}

class Selected_property_id_list {
  Selected_property_id_list({
    this.propertyName,
    this.propertyId,
    this.partId,
  });

  Selected_property_id_list.fromJson(dynamic json) {
    propertyName = json['property_name'];
    propertyId = json['property_id'];
    partId = json['part_id'];
  }

  String? propertyName;
  String? propertyId;
  String? partId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_name'] = propertyName;
    map['property_id'] = propertyId;
    map['part_id'] = partId;
    return map;
  }
}
