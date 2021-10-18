/*
class ProductSearchResponseModel {
  ProductSearchResponseModel({
    required this.data,
    required this.message,
    required this.error,
    required this.success,
    required this.status,
  });

  late final ProductSearchResponseData data;
  late final String message;
  late final bool error;
  late final bool success;
  late final int status;

  ProductSearchResponseModel.fromJson(Map<String, dynamic> json) {
    data = ProductSearchResponseData.fromJson(json['data']);
    message = json['message'];
    error = json['error'];
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['error'] = error;
    _data['success'] = success;
    _data['status'] = status;
    return _data;
  }
}

class ProductSearchResponseData {
  ProductSearchResponseData({
    required this.total,
    required this.pages,
    required this.limit,
    required this.page,
    required this.docs,
  });

  late final int total;
  late final int pages;
  late final int limit;
  late final int page;
  late final List<Docs> docs;

  ProductSearchResponseData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    limit = json['limit'];
    page = json['page'];
    docs = List.from(json['docs']).map((e) => Docs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['pages'] = pages;
    _data['limit'] = limit;
    _data['page'] = page;
    _data['docs'] = docs.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Docs {
  Docs({
    required this.id,
    required this.status,
    required this.trackingCode,
    required this.titleFa,
    required this.slugFa,
    required this.price,
    required this.inventory,
    required this.minOrder,
    required this.maxOrder,
    required this.images,
    required this.createdAt,
    required this.categoryListInfo,
    required this.itemId,
    required this.branchId,
    required this.shopId,
    required this.sellerId,
  });

  late final String id;
  late final int status;
  late final int trackingCode;
  late final String titleFa;
  late final String slugFa;
  late final String price;
  late final int inventory;
  late final int minOrder;
  late final int maxOrder;
  late final List<Images> images;
  late final String createdAt;
  late final List<CategoryListInfo> categoryListInfo;
  late final ItemId itemId;
  late final BranchId branchId;
  late final ShopId shopId;
  late final SellerId sellerId;

  Docs.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    trackingCode = json['tracking_code'];
    titleFa = json['title_fa'];
    slugFa = json['slug_fa'];
    price = json['price'];
    inventory = json['inventory'];
    minOrder = json['min_order'];
    maxOrder = json['max_order'];
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    createdAt = json['createdAt'];
    categoryListInfo = List.from(json['category_list_info'])
        .map((e) => CategoryListInfo.fromJson(e))
        .toList();
    itemId = ItemId.fromJson(json['item_id']);
    branchId = BranchId.fromJson(json['branch_id']);
    shopId = ShopId.fromJson(json['shop_id']);
    sellerId = SellerId.fromJson(json['seller_id']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['tracking_code'] = trackingCode;
    _data['title_fa'] = titleFa;
    _data['slug_fa'] = slugFa;
    _data['price'] = price;
    _data['inventory'] = inventory;
    _data['min_order'] = minOrder;
    _data['max_order'] = maxOrder;
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['category_list_info'] =
        categoryListInfo.map((e) => e.toJson()).toList();
    _data['item_id'] = itemId.toJson();
    _data['branch_id'] = branchId.toJson();
    _data['shop_id'] = shopId.toJson();
    _data['seller_id'] = sellerId.toJson();
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.type,
    required this.url,
  });

  late final String id;
  late final String type;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['type'] = type;
    _data['url'] = url;
    return _data;
  }
}

class CategoryListInfo {
  CategoryListInfo({
    required this.id,
    required this.status,
    required this.titleFa,
  });

  late final String id;
  late final int status;
  late final String titleFa;

  CategoryListInfo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    titleFa = json['title_fa'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['title_fa'] = titleFa;
    return _data;
  }
}

class ItemId {
  ItemId({
    required this.id,
    required this.status,
    required this.nameFa,
  });

  late final String id;
  late final int status;
  late final String nameFa;

  ItemId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    nameFa = json['name_fa'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['name_fa'] = nameFa;
    return _data;
  }
}

class BranchId {
  BranchId({
    required this.id,
    required this.status,
    required this.name,
    required this.isTax,
  });

  late final String id;
  late final int status;
  late final String name;
  late final bool isTax;

  BranchId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    name = json['name'];
    isTax = json['is_tax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['name'] = name;
    _data['is_tax'] = isTax;
    return _data;
  }
}

class ShopId {
  ShopId({
    required this.id,
    required this.status,
  });

  late final String id;
  late final int status;

  ShopId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    return _data;
  }
}

class SellerId {
  SellerId({
    required this.id,
    required this.status,
  });

  late final String id;
  late final int status;

  SellerId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    return _data;
  }
}

class ProductSearchRequestModel {
  String? str; // Main Entry
  String? cat;
  String? br;
  int page;
  int limit;

  ProductSearchRequestModel({
    this.str,
    this.cat,
    this.br,
    required this.page,
    required this.limit,
  });

  ProductSearchRequestModel.fromJson(Map<String, dynamic> json)
      : str = json['str'],
        cat = json['cat'],
        br = json['br'],
        page = json['page'],
        limit = json['limit'];

  Map<String, dynamic> toJson() => {
        "str": str,
        "cat": cat,
        "br": br,
        "page": page,
        "limit": limit,
      };
}
*/
