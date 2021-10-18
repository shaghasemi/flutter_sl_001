class ProductSingleResponseModel {
  final ProductSingleData? data;
  final String? message;
  final bool? error;
  final bool? success;
  final int? status;

  ProductSingleResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ProductSingleResponseModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as Map<String, dynamic>?) != null
            ? ProductSingleData.fromJson(json['data'] as Map<String, dynamic>)
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

class ProductSingleData {
  final int? status;
  final List<String>? categoryIdList;
  final String? titleEn;
  final String? slugEn;
  final List<String>? seoKeywords;
  final bool? supporting;
  final bool? returning;
  final String? discountPercent;
  final String? marketerCommission;
  final String? id;
  final int? trackingCode;
  final String? sellerId;
  final String? itemId;
  final ShopId? shopId;
  final BranchId? branchId;
  final String? titleFa;
  final String? slugFa;
  final String? unit;
  final List<PriceRatioRangeList>? priceRatioRangeList;
  final List<PackList>? packList;
  final String? price;
  final String? discountEndDate;
  final int? inventory;
  final int? minOrder;
  final int? maxOrder;
  final String? description;
  final String? rules;
  final List<Images>? images;
  final List<PropertyList>? propertyList;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  ProductSingleData({
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
    this.packList,
    this.price,
    this.discountEndDate,
    this.inventory,
    this.minOrder,
    this.maxOrder,
    this.description,
    this.rules,
    this.images,
    this.propertyList,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ProductSingleData.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        categoryIdList = (json['category_id_list'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        titleEn = json['title_en'] as String?,
        slugEn = json['slug_en'] as String?,
        seoKeywords = (json['seo_keywords'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        supporting = json['supporting'] as bool?,
        returning = json['returning'] as bool?,
        discountPercent = json['discount_percent'] as String?,
        marketerCommission = json['marketer_commission'] as String?,
        id = json['_id'] as String?,
        trackingCode = json['tracking_code'] as int?,
        sellerId = json['seller_id'] as String?,
        itemId = json['item_id'] as String?,
        shopId = (json['shop_id'] as Map<String, dynamic>?) != null
            ? ShopId.fromJson(json['shop_id'] as Map<String, dynamic>)
            : null,
        branchId = (json['branch_id'] as Map<String, dynamic>?) != null
            ? BranchId.fromJson(json['branch_id'] as Map<String, dynamic>)
            : null,
        titleFa = json['title_fa'] as String?,
        slugFa = json['slug_fa'] as String?,
        unit = json['unit'] as String?,
        priceRatioRangeList = (json['price_ratio_range_list'] as List?)
            ?.map((dynamic e) =>
                PriceRatioRangeList.fromJson(e as Map<String, dynamic>))
            .toList(),
        packList = (json['pack_list'] as List?)
            ?.map((dynamic e) => PackList.fromJson(e as Map<String, dynamic>))
            .toList(),
        price = json['price'] as String?,
        discountEndDate = json['discount_end_date'] as String?,
        inventory = json['inventory'] as int?,
        minOrder = json['min_order'] as int?,
        maxOrder = json['max_order'] as int?,
        description = json['description'] as String?,
        rules = json['rules'] as String?,
        images = (json['images'] as List?)
            ?.map((dynamic e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        propertyList = (json['property_list'] as List?)
            ?.map(
                (dynamic e) => PropertyList.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'status': status,
        'category_id_list': categoryIdList,
        'title_en': titleEn,
        'slug_en': slugEn,
        'seo_keywords': seoKeywords,
        'supporting': supporting,
        'returning': returning,
        'discount_percent': discountPercent,
        'marketer_commission': marketerCommission,
        '_id': id,
        'tracking_code': trackingCode,
        'seller_id': sellerId,
        'item_id': itemId,
        'shop_id': shopId?.toJson(),
        'branch_id': branchId?.toJson(),
        'title_fa': titleFa,
        'slug_fa': slugFa,
        'unit': unit,
        'price_ratio_range_list':
            priceRatioRangeList?.map((e) => e.toJson()).toList(),
        'pack_list': packList?.map((e) => e.toJson()).toList(),
        'price': price,
        'discount_end_date': discountEndDate,
        'inventory': inventory,
        'min_order': minOrder,
        'max_order': maxOrder,
        'description': description,
        'rules': rules,
        'images': images?.map((e) => e.toJson()).toList(),
        'property_list': propertyList?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class ShopId {
  final int? status;
  final String? id;

  ShopId({
    this.status,
    this.id,
  });

  ShopId.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {'status': status, '_id': id};
}

class BranchId {
  final int? status;
  final String? id;

  BranchId({
    this.status,
    this.id,
  });

  BranchId.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {'status': status, '_id': id};
}

class PriceRatioRangeList {
  final String? id;
  final int? start;
  final int? end;
  final String? ratioPrice;

  PriceRatioRangeList({
    this.id,
    this.start,
    this.end,
    this.ratioPrice,
  });

  PriceRatioRangeList.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        start = json['start'] as int?,
        end = json['end'] as int?,
        ratioPrice = json['ratio_price'] as String?;

  Map<String, dynamic> toJson() =>
      {'_id': id, 'start': start, 'end': end, 'ratio_price': ratioPrice};
}

class PackList {
  final String? id;
  final String? name;
  final String? ratioUnit;

  PackList({
    this.id,
    this.name,
    this.ratioUnit,
  });

  PackList.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        ratioUnit = json['ratio_unit'] as String?;

  Map<String, dynamic> toJson() =>
      {'_id': id, 'name': name, 'ratio_unit': ratioUnit};
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

class PropertyList {
  final List<dynamic>? selectList;
  final String? id;
  final int? code;
  final int? index;
  final List<dynamic>? selectRatioList;
  final List<dynamic>? uploadList;

  PropertyList({
    this.selectList,
    this.id,
    this.code,
    this.index,
    this.selectRatioList,
    this.uploadList,
  });

  PropertyList.fromJson(Map<String, dynamic> json)
      : selectList = json['select_list'] as List?,
        id = json['_id'] as String?,
        code = json['code'] as int?,
        index = json['index'] as int?,
        selectRatioList = json['select_ratio_list'] as List?,
        uploadList = json['upload_list'] as List?;

  Map<String, dynamic> toJson() => {
        'select_list': selectList,
        '_id': id,
        'code': code,
        'index': index,
        'select_ratio_list': selectRatioList,
        'upload_list': uploadList
      };
}

class ProductSingleRequestModel {
  String id;

  ProductSingleRequestModel({
    required this.id,
  });

  ProductSingleRequestModel.fromJson(Map<String, dynamic> json)
      : id = json['id'];

  Map<String, dynamic> toJson() => {
        "id": id.trim(),
      };
}
