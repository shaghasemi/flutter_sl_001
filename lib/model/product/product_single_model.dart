class ProductSingleResponseModel {
  ProductSingleData? data;
  String? error;
  String? message;
  int? status;
  bool? success;

  ProductSingleResponseModel(
      {this.data, this.error, this.message, this.status, this.success});

  factory ProductSingleResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductSingleResponseModel(
      data: json['data'] != null
          ? ProductSingleData.fromJson(json['data'])
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
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductSingleData {
  int? v;
  String? id;
  BranchId? branch_id;
  List<String>? category_id_list;
  String? createdAt;
  String? description;
  String? discount_end_date;
  String? discount_percent;
  List<ImageModel>? images;
  int? inventory;
  ItemId? item_id;
  int? marketer_commission;
  String? marketer_commission_end_date;
  int? max_order;
  int? min_order;
  List<Pack>? pack_list;
  String? price;
  List<PriceRatioRange>? price_ratio_range_list;
  List<PropertyListProduct>? property_list;
  bool? returning;
  String? rules;
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

  ProductSingleData(
      {this.v,
      this.id,
      this.branch_id,
      this.category_id_list,
      this.createdAt,
      this.description,
      this.discount_end_date,
      this.discount_percent,
      this.images,
      this.inventory,
      this.item_id,
      this.marketer_commission,
      this.marketer_commission_end_date,
      this.max_order,
      this.min_order,
      this.pack_list,
      this.price,
      this.price_ratio_range_list,
      this.property_list,
      this.returning,
      this.rules,
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

  factory ProductSingleData.fromJson(Map<String, dynamic> json) {
    return ProductSingleData(
      v: json['__v'],
      id: json['_id'],
      branch_id: json['branch_id'] != null
          ? BranchId.fromJson(json['branch_id'])
          : null,
      category_id_list: json['category_id_list'] != null
          ? new List<String>.from(json['category_id_list'])
          : null,
      createdAt: json['createdAt'],
      description: json['description'],
      discount_end_date: json['discount_end_date'],
      discount_percent: json['discount_percent'],
      images: json['images'] != null
          ? (json['images'] as List).map((i) => ImageModel.fromJson(i)).toList()
          : null,
      inventory: json['inventory'],
      item_id:
          json['item_id'] != null ? ItemId.fromJson(json['item_id']) : null,
      marketer_commission: json['marketer_commission'],
      marketer_commission_end_date: json['marketer_commission_end_date'],
      max_order: json['max_order'],
      min_order: json['min_order'],
      pack_list: json['pack_list'] != null
          ? (json['pack_list'] as List).map((i) => Pack.fromJson(i)).toList()
          : null,
      price: json['price'],
      price_ratio_range_list: json['price_ratio_range_list'] != null
          ? (json['price_ratio_range_list'] as List)
              .map((i) => PriceRatioRange.fromJson(i))
              .toList()
          : null,
      property_list: json['property_list'] != null
          ? (json['property_list'] as List)
              .map((i) => PropertyListProduct.fromJson(i))
              .toList()
          : null,
      returning: json['returning'],
      rules: json['rules'],
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
    data['description'] = this.description;
    data['discount_end_date'] = this.discount_end_date;
    data['discount_percent'] = this.discount_percent;
    data['inventory'] = this.inventory;
    data['marketer_commission'] = this.marketer_commission;
    data['marketer_commission_end_date'] = this.marketer_commission_end_date;
    data['max_order'] = this.max_order;
    data['min_order'] = this.min_order;
    data['price'] = this.price;
    data['returning'] = this.returning;
    data['rules'] = this.rules;
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
    if (this.item_id != null) {
      data['item_id'] = this.item_id!.toJson();
    }
    if (this.pack_list != null) {
      data['pack_list'] = this.pack_list!.map((v) => v.toJson()).toList();
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

class Pack {
  String? id;
  String? name;
  String? ratio_unit;

  Pack({this.id, this.name, this.ratio_unit});

  factory Pack.fromJson(Map<String, dynamic> json) {
    return Pack(
      id: json['_id'],
      name: json['name'],
      ratio_unit: json['ratio_unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['ratio_unit'] = this.ratio_unit;
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

class ItemId {
  int? v;
  String? id;
  List<String>? category_id_list;
  String? createdAt;
  String? name_en;
  String? name_fa;

  // PackList? pack_list;
  List<PropertyList>? property_list;
  int? status;
  int? tracking_code;
  List<String>? unit_list;
  String? updatedAt;

  ItemId(
      {this.v,
      this.id,
      this.category_id_list,
      this.createdAt,
      this.name_en,
      this.name_fa,
      /*this.pack_list,*/ this.property_list,
      this.status,
      this.tracking_code,
      this.unit_list,
      this.updatedAt});

  factory ItemId.fromJson(Map<String, dynamic> json) {
    return ItemId(
      v: json['__v'],
      id: json['_id'],
      category_id_list: json['category_id_list'] != null
          ? new List<String>.from(json['category_id_list'])
          : null,
      createdAt: json['createdAt'],
      name_en: json['name_en'],
      name_fa: json['name_fa'],
      // pack_list: json['pack_list'] != null ? PackList.fromJson(json['pack_list']) : null,
      property_list: json['property_list'] != null
          ? (json['property_list'] as List)
              .map((i) => PropertyList.fromJson(i))
              .toList()
          : null,
      status: json['status'],
      tracking_code: json['tracking_code'],
      unit_list: json['unit_list'] != null
          ? new List<String>.from(json['unit_list'])
          : null,
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v;
    data['_id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name_en'] = this.name_en;
    data['name_fa'] = this.name_fa;
    data['status'] = this.status;
    data['tracking_code'] = this.tracking_code;
    data['updatedAt'] = this.updatedAt;
    if (this.category_id_list != null) {
      data['category_id_list'] = this.category_id_list;
    }
    /*if (this.pack_list != null) {
            data['pack_list'] = this.pack_list.toJson();
        }*/
    if (this.property_list != null) {
      data['property_list'] =
          this.property_list!.map((v) => v.toJson()).toList();
    }
    if (this.unit_list != null) {
      data['unit_list'] = this.unit_list;
    }
    return data;
  }
}

class PropertyList {
  String? id;
  bool? calculating;
  int? code;
  bool? comparing;
  int? index;
  bool? multiple;
  String? name_en;
  String? name_fa;
  bool? required;
  List<String>? select_list;
  bool? uploading;

  PropertyList(
      {this.id,
      this.calculating,
      this.code,
      this.comparing,
      this.index,
      this.multiple,
      this.name_en,
      this.name_fa,
      this.required,
      this.select_list,
      this.uploading});

  factory PropertyList.fromJson(Map<String, dynamic> json) {
    return PropertyList(
      id: json['_id'],
      calculating: json['calculating'],
      code: json['code'],
      comparing: json['comparing'],
      index: json['index'],
      multiple: json['multiple'],
      name_en: json['name_en'],
      name_fa: json['name_fa'],
      required: json['required'],
      select_list: json['select_list'] != null
          ? new List<String>.from(json['select_list'])
          : null,
      uploading: json['uploading'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['calculating'] = this.calculating;
    data['code'] = this.code;
    data['comparing'] = this.comparing;
    data['index'] = this.index;
    data['multiple'] = this.multiple;
    data['name_en'] = this.name_en;
    data['name_fa'] = this.name_fa;
    data['required'] = this.required;
    data['uploading'] = this.uploading;
    if (this.select_list != null) {
      data['select_list'] = this.select_list;
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

class PropertyListProduct {
  String? id;
  int? code;
  int? index;
  List<String>? select_list;
  List<SelectRatio>? select_ratio_list;
  List<Upload>? upload_list;

  PropertyListProduct(
      {this.id,
      this.code,
      this.index,
      this.select_list,
      this.select_ratio_list,
      this.upload_list});

  factory PropertyListProduct.fromJson(Map<String, dynamic> json) {
    return PropertyListProduct(
      id: json['_id'],
      code: json['code'],
      index: json['index'],
      select_list: json['select_list'] != null
          ? new List<String>.from(json['select_list'])
          : null,
      select_ratio_list: json['select_ratio_list'] != null
          ? (json['select_ratio_list'] as List)
              .map((i) => SelectRatio.fromJson(i))
              .toList()
          : null,
      upload_list: json['upload_list'] != null
          ? (json['upload_list'] as List)
              .map((i) => Upload.fromJson(i))
              .toList()
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
      data['upload_list'] = this.upload_list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upload {
  String? id;
  String? type;
  String? url;

  Upload({this.id, this.type, this.url});

  factory Upload.fromJson(Map<String, dynamic> json) {
    return Upload(
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
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class BranchId {
  String? id;
  String? name;
  int? status;

  BranchId({this.id, this.name, this.status});

  factory BranchId.fromJson(Map<String, dynamic> json) {
    return BranchId(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}

class ImageModel {
  String? id;
  String? type;
  String? url;

  ImageModel({this.id, this.type, this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
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
