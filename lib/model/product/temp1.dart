/*
class Temp1 {
  Temp1({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,});

  Temp1.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'];
    success = json['success'];
    status = json['status'];
  }

  Data? data;
  String? message;
  bool? error;
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
    this.categoryIdList,
    this.titleEn,
    this.slugEn,
    this.seoKeywords,
    this.supporting,
    this.returning,
    this.discountPercent,
    this.marketerCommission,
    this.id,
    this.trackingCode,
    this.sellerId,
    this.itemId,
    this.shopId,
    this.branchId,
    this.titleFa,
    this.slugFa,
    this.unit,
    this.priceRatioRangeList,
    // this.packList,
    this.price,
    this.discountEndDate,
    this.inventory,
    this.minOrder,
    this.maxOrder,
    this.images,
    this.propertyList,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.description,
    this.marketerCommissionEndDate,
    this.rules,});

  Data.fromJson(dynamic json) {
    status = json['status'];
    categoryIdList = json['category_id_list'] != null
        ? json['category_id_list'].cast<String>()
        : [];
    titleEn = json['title_en'];
    slugEn = json['slug_en'];
    seoKeywords =
    json['seo_keywords'] != null ? json['seo_keywords'].cast<String>() : [];
    supporting = json['supporting'];
    returning = json['returning'];
    discountPercent = json['discount_percent'];
    marketerCommission = json['marketer_commission'];
    id = json['_id'];
    trackingCode = json['tracking_code'];
    sellerId = json['seller_id'];
    itemId = json['item_id'] != null ? Item_id.fromJson(json['itemId']) : null;
    shopId = json['shop_id'] != null ? Shop_id.fromJson(json['shopId']) : null;
    branchId =
    json['branch_id'] != null ? Branch_id.fromJson(json['branchId']) : null;
    titleFa = json['title_fa'];
    slugFa = json['slug_fa'];
    unit = json['unit'];
    if (json['price_ratio_range_list'] != null) {
      priceRatioRangeList = [];
      json['price_ratio_range_list'].forEach((v) {
        priceRatioRangeList?.add(Price_ratio_range_list.fromJson(v));
      });
    }
    // packList = json['pack_list'];
    price = json['price'];
    discountEndDate = json['discount_end_date'];
    inventory = json['inventory'];
    minOrder = json['min_order'];
    maxOrder = json['max_order'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    if (json['property_list'] != null) {
      propertyList = [];
      json['property_list'].forEach((v) {
        propertyList?.add(Property_list.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    description = json['description'];
    marketerCommissionEndDate = json['marketer_commission_end_date'];
    rules = json['rules'];
  }

  int? status;
  List<String>? categoryIdList;
  String? titleEn;
  String? slugEn;
  List<String>? seoKeywords;
  bool? supporting;
  bool? returning;
  String? discountPercent;
  String? marketerCommission;
  String? id;
  int? trackingCode;
  String? sellerId;
  Item_id? itemId;
  Shop_id? shopId;
  Branch_id? branchId;
  String? titleFa;
  String? slugFa;
  String? unit;
  List<Price_ratio_range_list>? priceRatioRangeList;
  // Pack_list? packList;
  String? price;
  String? discountEndDate;
  int? inventory;
  int? minOrder;
  int? maxOrder;
  List<Images>? images;
  List<Property_list>? propertyList;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? description;
  String? marketerCommissionEndDate;
  String? rules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['category_id_list'] = categoryIdList;
    map['title_en'] = titleEn;
    map['slug_en'] = slugEn;
    map['seo_keywords'] = seoKeywords;
    map['supporting'] = supporting;
    map['returning'] = returning;
    map['discount_percent'] = discountPercent;
    map['marketer_commission'] = marketerCommission;
    map['_id'] = id;
    map['tracking_code'] = trackingCode;
    map['seller_id'] = sellerId;
    if (itemId != null) {
      map['item_id'] = itemId?.toJson();
    }
    if (shopId != null) {
      map['shop_id'] = shopId?.toJson();
    }
    if (branchId != null) {
      map['branch_id'] = branchId?.toJson();
    }
    map['title_fa'] = titleFa;
    map['slug_fa'] = slugFa;
    map['unit'] = unit;
    if (priceRatioRangeList != null) {
      map['price_ratio_range_list'] =
          priceRatioRangeList?.map((v) => v.toJson()).toList();
    }
    // map['pack_list'] = packList;
    map['price'] = price;
    map['discount_end_date'] = discountEndDate;
    map['inventory'] = inventory;
    map['min_order'] = minOrder;
    map['max_order'] = maxOrder;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (propertyList != null) {
      map['property_list'] = propertyList?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['description'] = description;
    map['marketer_commission_end_date'] = marketerCommissionEndDate;
    map['rules'] = rules;
    return map;
  }

}

class Property_list {
  Property_list({
    this.selectList,
    this.id,
    this.code,
    this.index,
    this.selectRatioList,
    this.uploadList,});

  Property_list.fromJson(dynamic json) {
    selectList =
    json['select_list'] != null ? json['select_list'].cast<String>() : [];
    id = json['_id'];
    code = json['code'];
    index = json['index'];
    if (json['select_ratio_list'] != null) {
      selectRatioList = [];
      json['select_ratio_list'].forEach((v) {
        selectRatioList?.add(Select_ratio_list.fromJson(v));
      });
    }
    */
/*if (json['upload_list'] != null) {
      uploadList = [];
      json['upload_list'].forEach((v) {
        uploadList?.add(dynamic.fromJson(v));
      });
    }*//*

  }

  List<String>? selectList;
  String? id;
  int? code;
  int? index;
  List<Select_ratio_list>? selectRatioList;
  List<dynamic>? uploadList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['select_list'] = selectList;
    map['_id'] = id;
    map['code'] = code;
    map['index'] = index;
    if (selectRatioList != null) {
      map['select_ratio_list'] =
          selectRatioList?.map((v) => v.toJson()).toList();
    }
    if (uploadList != null) {
      map['upload_list'] = uploadList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Select_ratio_list {
  Select_ratio_list({
    this.id,
    this.name,
    this.price,
    this.inventory,
    this.minOrder,
    this.maxOrder,});

  Select_ratio_list.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    price = json['price'];
    inventory = json['inventory'];
    minOrder = json['min_order'];
    maxOrder = json['max_order'];
  }

  String? id;
  String? name;
  String? price;
  int? inventory;
  int? minOrder;
  int? maxOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['inventory'] = inventory;
    map['min_order'] = minOrder;
    map['max_order'] = maxOrder;
    return map;
  }

}

class Images {
  Images({
    this.id,
    this.type,
    this.url,});

  Images.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    url = json['url'];
  }

  String? id;
  String? type;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['url'] = url;
    return map;
  }

}

*/
/*class Pack_list {
  Pack_list

  ({
  this.عدد,});

  Pack_list.fromJson(dynamic json) {
    عدد = json['عدد'] != null ? json['عدد'].cast<String>() : [];
    }

  List<String>?

  ع

  د

  د;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['عدد'] = عدد;
    return map;
  }

}*//*


class Price_ratio_range_list {
  Price_ratio_range_list({
    this.id,
    this.start,
    this.end,
    this.ratioPrice,});

  Price_ratio_range_list.fromJson(dynamic json) {
    id = json['_id'];
    start = json['start'];
    end = json['end'];
    ratioPrice = json['ratio_price'];
  }

  String? id;
  int? start;
  int? end;
  String? ratioPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['start'] = start;
    map['end'] = end;
    map['ratio_price'] = ratioPrice;
    return map;
  }

}

class Branch_id {
  Branch_id({
    this.status,
    this.id,
    this.name,});

  Branch_id.fromJson(dynamic json) {
    status = json['status'];
    id = json['_id'];
    name = json['name'];
  }

  int? status;
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['_id'] = id;
    map['name'] = name;
    return map;
  }

}

class Shop_id {
  Shop_id({
    this.status,
    this.id,});

  Shop_id.fromJson(dynamic json) {
    status = json['status'];
    id = json['_id'];
  }

  int? status;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['_id'] = id;
    return map;
  }

}

class Item_id {
  Item_id({
    this.status,
    this.categoryIdList,
    this.unitList,
    this.nameEn,
    this.id,
    this.nameFa,
    this.propertyList,
    this.trackingCode,
    this.createdAt,
    this.updatedAt,
    this.v,});

  Item_id.fromJson(dynamic json) {
    status = json['status'];
    categoryIdList = json['category_id_list'] != null
        ? json['category_id_list'].cast<String>()
        : [];
    unitList =
    json['unit_list'] != null ? json['unit_list'].cast<String>() : [];
    nameEn = json['name_en'];
    id = json['_id'];
    nameFa = json['name_fa'];
    if (json['property_list'] != null) {
      propertyList = [];
      json['property_list'].forEach((v) {
        propertyList?.add(Property_list.fromJson(v));
      });
    }
    trackingCode = json['tracking_code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  int? status;
  List<String>? categoryIdList;
  List<String>? unitList;
  String? nameEn;
  String? id;
  String? nameFa;
  List<Property_list>? propertyList;
  int? trackingCode;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['category_id_list'] = categoryIdList;
    map['unit_list'] = unitList;
    map['name_en'] = nameEn;
    map['_id'] = id;
    map['name_fa'] = nameFa;
    if (propertyList != null) {
      map['property_list'] = propertyList?.map((v) => v.toJson()).toList();
    }
    map['tracking_code'] = trackingCode;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class Property_list {
  Property_list({
    this.multiple,
    this.uploading,
    this.required,
    this.calculating,
    this.comparing,
    this.selectList,
    this.id,
    this.index,
    this.nameFa,
    this.nameEn,
    this.code,});

  Property_list.fromJson(dynamic json) {
    multiple = json['multiple'];
    uploading = json['uploading'];
    required = json['required'];
    calculating = json['calculating'];
    comparing = json['comparing'];
    selectList =
    json['select_list'] != null ? json['select_list'].cast<String>() : [];
    id = json['_id'];
    index = json['index'];
    nameFa = json['name_fa'];
    nameEn = json['name_en'];
    code = json['code'];
  }

  bool? multiple;
  bool? uploading;
  bool? required;
  bool? calculating;
  bool? comparing;
  List<String>? selectList;
  String? id;
  int? index;
  String? nameFa;
  String? nameEn;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['multiple'] = multiple;
    map['uploading'] = uploading;
    map['required'] = required;
    map['calculating'] = calculating;
    map['comparing'] = comparing;
    map['select_list'] = selectList;
    map['_id'] = id;
    map['index'] = index;
    map['name_fa'] = nameFa;
    map['name_en'] = nameEn;
    map['code'] = code;
    return map;
  }

}*/
