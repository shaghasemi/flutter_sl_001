class asdaszxv {
  List<Data>? data;
  bool? error;
  String? message;
  int? status;
  bool? success;

  asdaszxv({this.data, this.error, this.message, this.status, this.success});

  factory asdaszxv.fromJson(Map<String, dynamic> json) {
    return asdaszxv(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => Data.fromJson(i)).toList()
          : null,
      error: json['error'],
      message: json['message'],
      status: json['status'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? v;
  String? id;
  BranchId? branch_id;
  List<String>? category_id_list;
  String? createdAt;
  String? discount_end_date;
  String? discount_percent;
  List<Image>? images;
  int? inventory;
  String? item_id;
  String? marketer_commission;
  int? max_order;
  int? min_order;
  List<String>? pack_list;
  String? price;
  List<PriceRatioRange>? price_ratio_range_list;
  List<Property>? property_list;
  bool? returning;
  String? seller_id;
  List<String>? seo_keywords;
  ShopId? shop_id;
  String? slug_en;
  String? slug_fa;
  int? status;
  bool? supporting;
  String? title_en;
  String? title_fa;
  int? tracking_code;
  String? unit;
  String? updatedAt;

  Data(
      {this.v,
      this.id,
      this.branch_id,
      this.category_id_list,
      this.createdAt,
      this.discount_end_date,
      this.discount_percent,
      this.images,
      this.inventory,
      this.item_id,
      this.marketer_commission,
      this.max_order,
      this.min_order,
      this.pack_list,
      this.price,
      this.price_ratio_range_list,
      this.property_list,
      this.returning,
      this.seller_id,
      this.seo_keywords,
      this.shop_id,
      this.slug_en,
      this.slug_fa,
      this.status,
      this.supporting,
      this.title_en,
      this.title_fa,
      this.tracking_code,
      this.unit,
      this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      v: json['__v'],
      id: json['_id'],
      branch_id: json['branch_id'] != null
          ? BranchId.fromJson(json['branch_id'])
          : null,
      category_id_list: json['category_id_list'] != null
          ? new List<String>.from(json['category_id_list'])
          : null,
      createdAt: json['createdAt'],
      discount_end_date: json['discount_end_date'],
      discount_percent: json['discount_percent'],
      images: json['images'] != null
          ? (json['images'] as List).map((i) => Image.fromJson(i)).toList()
          : null,
      inventory: json['inventory'],
      item_id: json['item_id'],
      marketer_commission: json['marketer_commission'],
      max_order: json['max_order'],
      min_order: json['min_order'],
      pack_list: json['pack_list'] != null
          ? new List<String>.from(json['pack_list'])
          : null,
      price: json['price'],
      price_ratio_range_list: json['price_ratio_range_list'] != null
          ? (json['price_ratio_range_list'] as List)
              .map((i) => PriceRatioRange.fromJson(i))
              .toList()
          : null,
      property_list: json['property_list'] != null
          ? (json['property_list'] as List)
              .map((i) => Property.fromJson(i))
              .toList()
          : null,
      returning: json['returning'],
      seller_id: json['seller_id'],
      seo_keywords: json['seo_keywords'] != null
          ? new List<String>.from(json['seo_keywords'])
          : null,
      shop_id:
          json['shop_id'] != null ? ShopId.fromJson(json['shop_id']) : null,
      slug_en: json['slug_en'],
      slug_fa: json['slug_fa'],
      status: json['status'],
      supporting: json['supporting'],
      title_en: json['title_en'],
      title_fa: json['title_fa'],
      tracking_code: json['tracking_code'],
      unit: json['unit'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v;
    data['_id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['discount_end_date'] = this.discount_end_date;
    data['discount_percent'] = this.discount_percent;
    data['inventory'] = this.inventory;
    data['item_id'] = this.item_id;
    data['marketer_commission'] = this.marketer_commission;
    data['max_order'] = this.max_order;
    data['min_order'] = this.min_order;
    data['price'] = this.price;
    data['returning'] = this.returning;
    data['seller_id'] = this.seller_id;
    data['slug_en'] = this.slug_en;
    data['slug_fa'] = this.slug_fa;
    data['status'] = this.status;
    data['supporting'] = this.supporting;
    data['title_en'] = this.title_en;
    data['title_fa'] = this.title_fa;
    data['tracking_code'] = this.tracking_code;
    data['unit'] = this.unit;
    data['updatedAt'] = this.updatedAt;
    if (this.branch_id != null) {
      data['branch_id'] = this.branch_id!.toJson();
    }
    if (this.category_id_list != null) {
      data['category_id_list'] = this.category_id_list;
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.pack_list != null) {
      data['pack_list'] = this.pack_list;
    }
    if (this.price_ratio_range_list != null) {
      data['price_ratio_range_list'] =
          this.price_ratio_range_list!.map((v) => v.toJson()).toList();
    }
    if (this.property_list != null) {
      data['property_list'] =
          this.property_list!.map((v) => v.toJson()).toList();
    }
    if (this.seo_keywords != null) {
      data['seo_keywords'] = this.seo_keywords;
    }
    if (this.shop_id != null) {
      data['shop_id'] = this.shop_id!.toJson();
    }
    return data;
  }
}

class ShopId {
  String? id;
  int? status;

  ShopId({this.id, this.status});

  factory ShopId.fromJson(Map<String, dynamic> json) {
    return ShopId(
      id: json['_id'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}

class BranchId {
  String? id;
  int? status;

  BranchId({this.id, this.status});

  factory BranchId.fromJson(Map<String, dynamic> json) {
    return BranchId(
      id: json['_id'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}

class PriceRatioRange {
  String? id;
  int? end;
  String? ratio_price;
  int? start;

  PriceRatioRange({this.id, this.end, this.ratio_price, this.start});

  factory PriceRatioRange.fromJson(Map<String, dynamic> json) {
    return PriceRatioRange(
      id: json['_id'],
      end: json['end'],
      ratio_price: json['ratio_price'],
      start: json['start'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['end'] = this.end;
    data['ratio_price'] = this.ratio_price;
    data['start'] = this.start;
    return data;
  }
}

class Image {
  String? id;
  String? type;
  String? url;

  Image({this.id, this.type, this.url});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['_id'],
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Property {
  String? id;
  int? code;
  int? index;
  List<String>? select_list;
  List<SelectRatio>? select_ratio_list;
  List<String>? upload_list;

  Property(
      {this.id,
      this.code,
      this.index,
      this.select_list,
      this.select_ratio_list,
      this.upload_list});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['_id'],
      code: json['code'],
      index: json['index'],
      /*select_list: json['select_list'] != null
          ? (json['select_list'] as List)
              .map((i) => String.fromJson(i))
              .toList()
          : null,*/
      select_list: json['select_list'] != null
          ? new List<String>.from(json['select_list'])
          : null,
      select_ratio_list: json['select_ratio_list'] != null
          ? (json['select_ratio_list'] as List)
              .map((i) => SelectRatio.fromJson(i))
              .toList()
          : null,
      upload_list: json['upload_list'] != null
          ? new List<String>.from(json['upload_list'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['code'] = this.code;
    data['index'] = this.index;
    if (this.select_list != null) {
      data['select_list'] = this.select_list;
    }
    if (this.select_ratio_list != null) {
      data['select_ratio_list'] =
          this.select_ratio_list!.map((v) => v.toJson()).toList();
    }
    if (this.upload_list != null) {
      data['upload_list'] = this.upload_list;
    }
    return data;
  }
}

class SelectRatio {
  String? id;
  int? inventory;
  int? max_order;
  int? min_order;
  String? name;
  String? price;

  SelectRatio(
      {this.id,
      this.inventory,
      this.max_order,
      this.min_order,
      this.name,
      this.price});

  factory SelectRatio.fromJson(Map<String, dynamic> json) {
    return SelectRatio(
      id: json['_id'],
      inventory: json['inventory'],
      max_order: json['max_order'],
      min_order: json['min_order'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['inventory'] = this.inventory;
    data['max_order'] = this.max_order;
    data['min_order'] = this.min_order;
    data['price'] = this.price;
    data['name'] = this.name;
    return data;
  }
}
