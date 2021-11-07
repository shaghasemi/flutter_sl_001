class ProductListByCategoryResponseModel {
  ProductListByCategoryResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ProductListByCategoryResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductListByCategoryData.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'];
    success = json['success'];
    status = json['status'];
  }

  List<ProductListByCategoryData>? data;
  String? message;
  bool? error;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class ProductListByCategoryData {
  ProductListByCategoryData({
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
    // this.shopId,
    // this.branchId,
    this.titleFa,
    this.slugFa,
    this.unit,
    this.priceRatioRangeList,
    this.packList,
    this.price,
    this.discountEndDate,
    this.inventory,
    this.minOrder,
    this.maxOrder,
    this.images,
    this.propertyList,
    this.marketerCommissionEndDate,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ProductListByCategoryData.fromJson(dynamic json) {
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
    itemId = json['item_id'];

    // These two were causing issues for future builder
    // shopId = json['shop_id'] != null ? Shop_id.fromJson(json['shopId']) : null;
    // branchId = json['branch_id'] != null ? Branch_id.fromJson(json['branchId']) : null;
    titleFa = json['title_fa'];
    slugFa = json['slug_fa'];
    unit = json['unit'];
    if (json['price_ratio_range_list'] != null) {
      priceRatioRangeList = [];
      json['price_ratio_range_list'].forEach((v) {
        priceRatioRangeList?.add(Price_ratio_range_list.fromJson(v));
      });
    }
    if (json['pack_list'] != null) {
      packList = [];
      json['pack_list'].forEach((v) {
        packList?.add(Pack_list.fromJson(v));
      });
    }
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
    marketerCommissionEndDate = json['marketer_commission_end_date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  int? status;
  List<String>? categoryIdList;
  String? titleEn;
  String? slugEn;
  List<String>? seoKeywords;
  bool? supporting;
  bool? returning;
  String? discountPercent;
  int? marketerCommission;
  String? id;
  int? trackingCode;
  String? sellerId;
  String? itemId;
  Shop_id? shopId;
  Branch_id? branchId;
  String? titleFa;
  String? slugFa;
  String? unit;
  List<Price_ratio_range_list>? priceRatioRangeList;
  List<Pack_list>? packList;
  String? price;
  String? discountEndDate;
  int? inventory;
  int? minOrder;
  int? maxOrder;
  List<Images>? images;
  List<Property_list>? propertyList;
  String? marketerCommissionEndDate;
  String? createdAt;
  String? updatedAt;
  int? v;

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
    map['item_id'] = itemId;
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
    if (packList != null) {
      map['pack_list'] = packList?.map((v) => v.toJson()).toList();
    }
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
    map['marketer_commission_end_date'] = marketerCommissionEndDate;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Property_list {
  Property_list({
    this.selectList,
    this.id,
    this.code,
    // this.selectRatioList,
    // this.uploadList,
    this.index,
  });

  Property_list.fromJson(dynamic json) {
    /*if (json['select_list'] != null) {
      selectList = [];
      json['select_list'].forEach((v) {
        selectList?.add(dynamic.fromJson(v));
      });
    }*/
    id = json['_id'];
    code = json['code'];
    /*if (json['select_ratio_list'] != null) {
      selectRatioList = [];
      json['select_ratio_list'].forEach((v) {
        selectRatioList?.add(dynamic.fromJson(v));
      });
    }*/
    /*if (json['upload_list'] != null) {
      uploadList = [];
      json['upload_list'].forEach((v) {
        uploadList?.add(dynamic.fromJson(v));
      });
    }*/
    index = json['index'];
  }

  List<dynamic>? selectList;
  String? id;
  int? code;
  List<dynamic>? selectRatioList;
  List<dynamic>? uploadList;
  int? index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (selectList != null) {
      map['select_list'] = selectList?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['code'] = code;
    if (selectRatioList != null) {
      map['select_ratio_list'] =
          selectRatioList?.map((v) => v.toJson()).toList();
    }
    if (uploadList != null) {
      map['upload_list'] = uploadList?.map((v) => v.toJson()).toList();
    }
    map['index'] = index;
    return map;
  }
}

class Images {
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

class Pack_list {
  Pack_list({
    this.id,
    this.name,
    this.ratioUnit,
  });

  Pack_list.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    ratioUnit = json['ratio_unit'];
  }

  String? id;
  String? name;
  String? ratioUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['ratio_unit'] = ratioUnit;
    return map;
  }
}

class Price_ratio_range_list {
  Price_ratio_range_list({
    this.id,
    this.start,
    this.end,
    this.ratioPrice,
  });

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
  });

  Branch_id.fromJson(dynamic json) {
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

class Shop_id {
  Shop_id({
    this.status,
    this.id,
  });

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

class ProductListByCategoryRequestModel {
  String categoryId;

  ProductListByCategoryRequestModel({
    required this.categoryId,
  });

  ProductListByCategoryRequestModel.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'];

  Map<String, dynamic> toJson() => {
        "category_id": categoryId.trim(),
      };
}
