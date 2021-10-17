class ProductLatestResponseModel {
  ProductLatestData? data;
  bool? error;
  String? message;
  int? status;
  bool? success;

  ProductLatestResponseModel({
    this.data,
    this.error,
    this.message,
    this.status,
    this.success,
  });

  factory ProductLatestResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductLatestResponseModel(
      data: json['data'] != null
          ? ProductLatestData.fromJson(json['data'])
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

class ProductLatestData {
  List<Doc>? docs;
  bool? hasNextPage;
  bool? hasPrevPage;
  int? limit;
  int? nextPage;
  int? page;
  int? pagingCounter;
  int? prevPage;
  int? totalDocs;
  int? totalPages;

  ProductLatestData({
    this.docs,
    this.hasNextPage,
    this.hasPrevPage,
    this.limit,
    this.nextPage,
    this.page,
    this.pagingCounter,
    this.prevPage,
    this.totalDocs,
    this.totalPages,
  });

  factory ProductLatestData.fromJson(Map<String, dynamic> json) {
    return ProductLatestData(
      docs: json['docs'] != null
          ? (json['docs'] as List).map((i) => Doc.fromJson(i)).toList()
          : null,
      hasNextPage: json['hasNextPage'],
      hasPrevPage: json['hasPrevPage'],
      limit: json['limit'],
      nextPage: json['nextPage'],
      page: json['page'],
      pagingCounter: json['pagingCounter'],
      prevPage: json['prevPage'],
      totalDocs: json['totalDocs'],
      totalPages: json['totalPages'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasNextPage'] = this.hasNextPage;
    data['hasPrevPage'] = this.hasPrevPage;
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['pagingCounter'] = this.pagingCounter;
    data['totalDocs'] = this.totalDocs;
    data['totalPages'] = this.totalPages;
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = this.nextPage;

    data['prevPage'] = this.prevPage;
    return data;
  }
}

class Doc {
  String? id;
  BranchId? branch_id;
  List<String>? category_id_list;
  List<ImageProductLatest>? images;
  int? inventory;
  String? item_id;
  int? max_order;
  int? min_order;
  String? price;
  SellerId? seller_id;
  List<String>? seo_keywords;
  ShopId? shop_id;
  String? slug_en;
  String? slug_fa;
  int? status;
  String? title_en;
  String? title_fa;
  int? tracking_code;
  String? unit;

  Doc(
      {this.id,
      this.branch_id,
      this.category_id_list,
      this.images,
      this.inventory,
      this.item_id,
      this.max_order,
      this.min_order,
      this.price,
      this.seller_id,
      this.seo_keywords,
      this.shop_id,
      this.slug_en,
      this.slug_fa,
      this.status,
      this.title_en,
      this.title_fa,
      this.tracking_code,
      this.unit});

  factory Doc.fromJson(Map<String, dynamic> json) {
    return Doc(
      id: json['_id'],
      branch_id: json['branch_id'] != null
          ? BranchId.fromJson(json['branch_id'])
          : null,
      category_id_list: json['category_id_list'] != null
          ? new List<String>.from(json['category_id_list'])
          : null,
      images: json['images'] != null
          ? (json['images'] as List).map((i) => ImageProductLatest.fromJson(i)).toList()
          : null,
      inventory: json['inventory'],
      item_id: json['item_id'],
      max_order: json['max_order'],
      min_order: json['min_order'],
      price: json['price'],
      seller_id: json['seller_id'] != null
          ? SellerId.fromJson(json['seller_id'])
          : null,
      seo_keywords: json['seo_keywords'] != null
          ? new List<String>.from(json['seo_keywords'])
          : null,
      shop_id:
          json['shop_id'] != null ? ShopId.fromJson(json['shop_id']) : null,
      slug_en: json['slug_en'],
      slug_fa: json['slug_fa'],
      status: json['status'],
      title_en: json['title_en'],
      title_fa: json['title_fa'],
      tracking_code: json['tracking_code'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['inventory'] = this.inventory;
    data['item_id'] = this.item_id;
    data['max_order'] = this.max_order;
    data['min_order'] = this.min_order;
    data['price'] = this.price;
    data['slug_en'] = this.slug_en;
    data['slug_fa'] = this.slug_fa;
    data['status'] = this.status;
    data['title_en'] = this.title_en;
    data['title_fa'] = this.title_fa;
    data['tracking_code'] = this.tracking_code;
    data['unit'] = this.unit;
    if (this.branch_id != null) {
      data['branch_id'] = this.branch_id!.toJson();
    }
    if (this.category_id_list != null) {
      data['category_id_list'] = this.category_id_list;
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.seller_id != null) {
      data['seller_id'] = this.seller_id!.toJson();
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

class SellerId {
  String? id;

  SellerId({this.id});

  factory SellerId.fromJson(Map<String, dynamic> json) {
    return SellerId(
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    return data;
  }
}

class BranchId {
  String? id;
  String? address;
  String? name;

  BranchId({this.id, this.address, this.name});

  factory BranchId.fromJson(Map<String, dynamic> json) {
    return BranchId(
      id: json['_id'],
      address: json['address'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['address'] = this.address;
    data['name'] = this.name;
    return data;
  }
}

class ShopId {
  String? id;
  String? commercial_name;

  ShopId({this.id, this.commercial_name});

  factory ShopId.fromJson(Map<String, dynamic> json) {
    return ShopId(
      id: json['_id'],
      commercial_name: json['commercial_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['commercial_name'] = this.commercial_name;
    return data;
  }
}

class ImageProductLatest {
  String? id;
  String? type;
  String? url;

  ImageProductLatest({this.id, this.type, this.url});

  factory ImageProductLatest.fromJson(Map<String, dynamic> json) {
    return ImageProductLatest(
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

class ProductLatestRequestModel {
  int num;
  int? page;
  int? limit;
  String cat_id;

  ProductLatestRequestModel({
    required this.num,
    this.page,
    this.limit,
    required this.cat_id,
  });

  ProductLatestRequestModel.fromJson(Map<String, dynamic> json)
      : num = json['num'],
        page = json['page'],
        limit = json['limit'],
        cat_id = json['cat_id'];

  Map<String, dynamic> toJson() => {
        "num": num,
        "page": page,
        "limit": limit,
        "cat_id": cat_id.trim(),
      };
}
