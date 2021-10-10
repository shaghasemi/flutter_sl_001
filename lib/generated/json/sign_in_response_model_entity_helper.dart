import 'package:flutter_sl_001/model/panel/sign_in_response_model_entity.dart';

signInResponseModelEntityFromJson(SignInResponseModelEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = SignInResponseModelData().fromJson(json['data']);
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['error'] != null) {
		data.error = (json['error'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['success'] != null) {
		data.success = json['success'];
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	return data;
}

Map<String, dynamic> signInResponseModelEntityToJson(SignInResponseModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] = entity.data.toJson();
	data['message'] = entity.message;
	data['error'] = entity.error;
	data['success'] = entity.success;
	data['status'] = entity.status;
	return data;
}

signInResponseModelDataFromJson(SignInResponseModelData data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['_id'] != null) {
		data.sId = json['_id'].toString();
	}
	if (json['tracking_code'] != null) {
		data.trackingCode = json['tracking_code'] is String
				? int.tryParse(json['tracking_code'])
				: json['tracking_code'].toInt();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile'].toString();
	}
	if (json['user_id'] != null) {
		data.userId = SignInResponseModelDataUserId().fromJson(json['user_id']);
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt'].toString();
	}
	if (json['updatedAt'] != null) {
		data.updatedAt = json['updatedAt'].toString();
	}
	if (json['__v'] != null) {
		data.iV = json['__v'] is String
				? int.tryParse(json['__v'])
				: json['__v'].toInt();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	return data;
}

Map<String, dynamic> signInResponseModelDataToJson(SignInResponseModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['_id'] = entity.sId;
	data['tracking_code'] = entity.trackingCode;
	data['mobile'] = entity.mobile;
	data['user_id'] = entity.userId.toJson();
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['__v'] = entity.iV;
	data['token'] = entity.token;
	data['type'] = entity.type;
	return data;
}

signInResponseModelDataUserIdFromJson(SignInResponseModelDataUserId data, Map<String, dynamic> json) {
	if (json['company'] != null) {
		data.company = SignInResponseModelDataUserIdCompany().fromJson(json['company']);
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['family'] != null) {
		data.family = json['family'].toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender'] is String
				? int.tryParse(json['gender'])
				: json['gender'].toInt();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['national_code'] != null) {
		data.nationalCode = json['national_code'].toString();
	}
	if (json['telephone'] != null) {
		data.telephone = json['telephone'].toString();
	}
	if (json['sosPhone'] != null) {
		data.sosPhone = json['sosPhone'].toString();
	}
	if (json['postal_code'] != null) {
		data.postalCode = json['postal_code'].toString();
	}
	if (json['main_address'] != null) {
		data.mainAddress = json['main_address'].toString();
	}
	if (json['address_list'] != null) {
		data.addressList = (json['address_list'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['foreign_national'] != null) {
		data.foreignNational = json['foreign_national'].toString();
	}
	if (json['personal'] != null) {
		data.personal = json['personal'];
	}
	if (json['_id'] != null) {
		data.sId = json['_id'].toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile'].toString();
	}
	if (json['tracking_code'] != null) {
		data.trackingCode = json['tracking_code'] is String
				? int.tryParse(json['tracking_code'])
				: json['tracking_code'].toInt();
	}
	if (json['images'] != null) {
		data.images = (json['images'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt'].toString();
	}
	if (json['updatedAt'] != null) {
		data.updatedAt = json['updatedAt'].toString();
	}
	if (json['__v'] != null) {
		data.iV = json['__v'] is String
				? int.tryParse(json['__v'])
				: json['__v'].toInt();
	}
	return data;
}

Map<String, dynamic> signInResponseModelDataUserIdToJson(SignInResponseModelDataUserId entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['company'] = entity.company.toJson();
	data['status'] = entity.status;
	data['name'] = entity.name;
	data['family'] = entity.family;
	data['gender'] = entity.gender;
	data['email'] = entity.email;
	data['national_code'] = entity.nationalCode;
	data['telephone'] = entity.telephone;
	data['sosPhone'] = entity.sosPhone;
	data['postal_code'] = entity.postalCode;
	data['main_address'] = entity.mainAddress;
	data['address_list'] = entity.addressList;
	data['foreign_national'] = entity.foreignNational;
	data['personal'] = entity.personal;
	data['_id'] = entity.sId;
	data['mobile'] = entity.mobile;
	data['tracking_code'] = entity.trackingCode;
	data['images'] = entity.images;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['__v'] = entity.iV;
	return data;
}

signInResponseModelDataUserIdCompanyFromJson(SignInResponseModelDataUserIdCompany data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['telephone'] != null) {
		data.telephone = json['telephone'].toString();
	}
	if (json['postal_code'] != null) {
		data.postalCode = json['postal_code'].toString();
	}
	if (json['address'] != null) {
		data.address = json['address'].toString();
	}
	if (json['economic_code'] != null) {
		data.economicCode = json['economic_code'].toString();
	}
	if (json['national_id'] != null) {
		data.nationalId = json['national_id'].toString();
	}
	if (json['registration_code'] != null) {
		data.registrationCode = json['registration_code'].toString();
	}
	return data;
}

Map<String, dynamic> signInResponseModelDataUserIdCompanyToJson(SignInResponseModelDataUserIdCompany entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['telephone'] = entity.telephone;
	data['postal_code'] = entity.postalCode;
	data['address'] = entity.address;
	data['economic_code'] = entity.economicCode;
	data['national_id'] = entity.nationalId;
	data['registration_code'] = entity.registrationCode;
	return data;
}