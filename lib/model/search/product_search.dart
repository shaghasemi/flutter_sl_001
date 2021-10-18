class ProductSearchResponseModel {
  final ProductSearchData? data;
  final String? message;
  final bool? error;
  final bool? success;
  final int? status;

  ProductSearchResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ProductSearchResponseModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as Map<String, dynamic>?) != null
            ? ProductSearchData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'] as String?,
        error = json['error'] as bool?,
        success = json['success'] as bool?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'success': success,
        'status': status
      };
}

class ProductSearchData {
  final int? total;
  final int? pages;
  final int? limit;
  final int? page;
  final List<Docs>? docs;

  ProductSearchData({
    this.total,
    this.pages,
    this.limit,
    this.page,
    this.docs,
  });

  ProductSearchData.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        pages = json['pages'] as int?,
        limit = json['limit'] as int?,
        page = json['page'] as int?,
        docs = (json['docs'] as List?)
            ?.map((dynamic e) => Docs.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'total': total,
        'pages': pages,
        'limit': limit,
        'page': page,
        'docs': docs?.map((e) => e.toJson()).toList()
      };
}

class Docs {
  final String? id;
  final int? status;
  final int? trackingCode;
  final String? titleFa;
  final String? slugFa;
  final String? price;
  final int? inventory;
  final int? minOrder;
  final int? maxOrder;
  final List<Images>? images;
  final String? createdAt;
  final List<CategoryListInfo>? categoryListInfo;
  final ItemId? itemId;
  final BranchId? branchId;
  final ShopId? shopId;
  final SellerId? sellerId;

  Docs({
    this.id,
    this.status,
    this.trackingCode,
    this.titleFa,
    this.slugFa,
    this.price,
    this.inventory,
    this.minOrder,
    this.maxOrder,
    this.images,
    this.createdAt,
    this.categoryListInfo,
    this.itemId,
    this.branchId,
    this.shopId,
    this.sellerId,
  });

  Docs.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        status = json['status'] as int?,
        trackingCode = json['tracking_code'] as int?,
        titleFa = json['title_fa'] as String?,
        slugFa = json['slug_fa'] as String?,
        price = json['price'] as String?,
        inventory = json['inventory'] as int?,
        minOrder = json['min_order'] as int?,
        maxOrder = json['max_order'] as int?,
        images = (json['images'] as List?)
            ?.map((dynamic e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt = json['createdAt'] as String?,
        categoryListInfo = (json['category_list_info'] as List?)
            ?.map((dynamic e) =>
                CategoryListInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        itemId = (json['item_id'] as Map<String, dynamic>?) != null
            ? ItemId.fromJson(json['item_id'] as Map<String, dynamic>)
            : null,
        branchId = (json['branch_id'] as Map<String, dynamic>?) != null
            ? BranchId.fromJson(json['branch_id'] as Map<String, dynamic>)
            : null,
        shopId = (json['shop_id'] as Map<String, dynamic>?) != null
            ? ShopId.fromJson(json['shop_id'] as Map<String, dynamic>)
            : null,
        sellerId = (json['seller_id'] as Map<String, dynamic>?) != null
            ? SellerId.fromJson(json['seller_id'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'status': status,
        'tracking_code': trackingCode,
        'title_fa': titleFa,
        'slug_fa': slugFa,
        'price': price,
        'inventory': inventory,
        'min_order': minOrder,
        'max_order': maxOrder,
        'images': images?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt,
        'category_list_info': categoryListInfo?.map((e) => e.toJson()).toList(),
        'item_id': itemId?.toJson(),
        'branch_id': branchId?.toJson(),
        'shop_id': shopId?.toJson(),
        'seller_id': sellerId?.toJson()
      };
}

class Images {
  final String? id;
  final String? type;
  final String? url;

  Images({
    this.id,
    this.type,
    this.url,
  });

  Images.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        type = json['type'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'_id': id, 'type': type, 'url': url};
}

class CategoryListInfo {
  final String? id;
  final int? status;
  final String? titleFa;

  CategoryListInfo({
    this.id,
    this.status,
    this.titleFa,
  });

  CategoryListInfo.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        status = json['status'] as int?,
        titleFa = json['title_fa'] as String?;

  Map<String, dynamic> toJson() =>
      {'_id': id, 'status': status, 'title_fa': titleFa};
}

class ItemId {
  final String? id;
  final int? status;
  final String? nameFa;

  ItemId({
    this.id,
    this.status,
    this.nameFa,
  });

  ItemId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        status = json['status'] as int?,
        nameFa = json['name_fa'] as String?;

  Map<String, dynamic> toJson() =>
      {'_id': id, 'status': status, 'name_fa': nameFa};
}

class BranchId {
  final String? id;
  final int? status;
  final String? name;
  final bool? isTax;

  BranchId({
    this.id,
    this.status,
    this.name,
    this.isTax,
  });

  BranchId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        status = json['status'] as int?,
        name = json['name'] as String?,
        isTax = json['is_tax'] as bool?;

  Map<String, dynamic> toJson() =>
      {'_id': id, 'status': status, 'name': name, 'is_tax': isTax};
}

class ShopId {
  final String? id;
  final int? status;

  ShopId({
    this.id,
    this.status,
  });

  ShopId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() => {'_id': id, 'status': status};
}

class SellerId {
  final String? id;
  final int? status;

  SellerId({
    this.id,
    this.status,
  });

  SellerId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() => {'_id': id, 'status': status};
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
