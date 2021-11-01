class ProcessingResponseModel {
  final List<ProcessingResponseData>? data;
  final String? message;
  final bool? error;
  final bool? success;
  final int? status;

  ProcessingResponseModel({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  ProcessingResponseModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)
            ?.map((dynamic e) =>
                ProcessingResponseData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message = json['message'] as String?,
        error = json['error'] as bool?,
        success = json['success'] as bool?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        // 'message': message,
        'error': error,
        'success': success,
        'status': status
      };
}

class ProcessingResponseData {
  final ProcessingResponseOrder? order;
  final ProcessingResponseProduct? product;
  final ProcessingResponseCalculated? calculated;

  ProcessingResponseData({
    this.order,
    this.product,
    this.calculated,
  });

  ProcessingResponseData.fromJson(Map<String, dynamic> json)
      : order = (json['order'] as Map<String, dynamic>?) != null
            ? ProcessingResponseOrder.fromJson(
                json['order'] as Map<String, dynamic>)
            : null,
        product = (json['product'] as Map<String, dynamic>?) != null
            ? ProcessingResponseProduct.fromJson(
                json['product'] as Map<String, dynamic>)
            : null,
        calculated = (json['calculated'] as Map<String, dynamic>?) != null
            ? ProcessingResponseCalculated.fromJson(
                json['calculated'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'order': order?.toJson(),
        'product': product?.toJson(),
        'calculated': calculated?.toJson()
      };
}

class ProcessingResponseOrder {
  final String? id;
  final String? packId;
  final int? number;
  final List<ProcessingResponseSelectedPropertyIdList>? selectedPropertyIdList;
  final String? address;
  final double? lat;
  final double? lon;
  final String? province;
  final String? city;

  ProcessingResponseOrder({
    this.id,
    this.packId,
    this.number,
    this.selectedPropertyIdList,
    this.address,
    this.lat,
    this.lon,
    this.province,
    this.city,
  });

  ProcessingResponseOrder.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        packId = json['pack_id'] as String?,
        number = json['number'] as int?,
        selectedPropertyIdList = (json['selected_property_id_list'] as List?)
            ?.map((dynamic e) =>
                ProcessingResponseSelectedPropertyIdList.fromJson(
                    e as Map<String, dynamic>))
            .toList(),
        address = json['address'] as String?,
        lat = json['lat'] as double?,
        lon = json['lon'] as double?,
        province = json['province'] as String?,
        city = json['city'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'pack_id': packId,
        'number': number,
        'selected_property_id_list':
            selectedPropertyIdList?.map((e) => e.toJson()).toList(),
        'address': address,
        'lat': lat,
        'lon': lon,
        'province': province,
        'city': city
      };
}

class ProcessingResponseSelectedPropertyIdList {
  final String? propertyName;
  final String? propertyId;
  final String? partId;

  ProcessingResponseSelectedPropertyIdList({
    this.propertyName,
    this.propertyId,
    this.partId,
  });

  ProcessingResponseSelectedPropertyIdList.fromJson(Map<String, dynamic> json)
      : propertyName = json['property_name'] as String?,
        propertyId = json['property_id'] as String?,
        partId = json['part_id'] as String?;

  Map<String, dynamic> toJson() => {
        'property_name': propertyName,
        'property_id': propertyId,
        'part_id': partId
      };
}

class ProcessingResponseProduct {
  final int? status;
  final String? titleEn;
  final bool? supporting;
  final bool? returning;
  final int? marketerCommission;
  final String? id;
  final ProcessingResponseShopId? shopId;
  final ProcessingResponseBranchId? branchId;
  final String? titleFa;
  final String? unit;
  final int? inventory;
  final int? minOrder;
  final int? maxOrder;
  final String? description;
  final String? rules;
  final String? images;

  ProcessingResponseProduct({
    this.status,
    this.titleEn,
    this.supporting,
    this.returning,
    this.marketerCommission,
    this.id,
    this.shopId,
    this.branchId,
    this.titleFa,
    this.unit,
    this.inventory,
    this.minOrder,
    this.maxOrder,
    this.description,
    this.rules,
    this.images,
  });

  ProcessingResponseProduct.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        titleEn = json['title_en'] as String?,
        supporting = json['supporting'] as bool?,
        returning = json['returning'] as bool?,
        marketerCommission = json['marketer_commission'] as int?,
        id = json['_id'] as String?,
        shopId = (json['shop_id'] as Map<String, dynamic>?) != null
            ? ProcessingResponseShopId.fromJson(
                json['shop_id'] as Map<String, dynamic>)
            : null,
        branchId = (json['branch_id'] as Map<String, dynamic>?) != null
            ? ProcessingResponseBranchId.fromJson(
                json['branch_id'] as Map<String, dynamic>)
            : null,
        titleFa = json['title_fa'] as String?,
        unit = json['unit'] as String?,
        inventory = json['inventory'] as int?,
        minOrder = json['min_order'] as int?,
        maxOrder = json['max_order'] as int?,
        description = json['description'] as String?,
        rules = json['rules'] as String?,
        images = json['images'] as String?;

  Map<String, dynamic> toJson() => {
        'status': status,
        'title_en': titleEn,
        'supporting': supporting,
        'returning': returning,
        'marketer_commission': marketerCommission,
        '_id': id,
        'shop_id': shopId?.toJson(),
        'branch_id': branchId?.toJson(),
        'title_fa': titleFa,
        'unit': unit,
        'inventory': inventory,
        'min_order': minOrder,
        'max_order': maxOrder,
        'description': description,
        'rules': rules,
        'images': images
      };
}

class ProcessingResponseShopId {
  final String? commercialName;
  final String? id;
  final int? status;

  ProcessingResponseShopId({
    this.commercialName,
    this.id,
    this.status,
  });

  ProcessingResponseShopId.fromJson(Map<String, dynamic> json)
      : commercialName = json['commercial_name'] as String?,
        id = json['_id'] as String?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() =>
      {'commercial_name': commercialName, '_id': id, 'status': status};
}

class ProcessingResponseBranchId {
  final String? name;
  final String? id;
  final int? status;

  ProcessingResponseBranchId({
    this.name,
    this.id,
    this.status,
  });

  ProcessingResponseBranchId.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        id = json['_id'] as String?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() => {'name': name, '_id': id, 'status': status};
}

class ProcessingResponseCalculated {
  final ProcessingResponsePackInfo? packInfo;
  final int? rangePriceRatio;
  final List<ProcessingResponsePropertyListInfo>? propertyListInfo;
  final int? propertyPriceRatio;
  final int? discountPriceRatio;
  final int? priceRatioSum;
  final int? priceRatioNumber;
  final int? price;
  final int? newPrice;
  final int? number;
  final int? ratioUnitNumber;
  final int? currentPrice;
  final int? currentNumber;
  final int? total;

  ProcessingResponseCalculated({
    this.packInfo,
    this.rangePriceRatio,
    this.propertyListInfo,
    this.propertyPriceRatio,
    this.discountPriceRatio,
    this.priceRatioSum,
    this.priceRatioNumber,
    this.price,
    this.newPrice,
    this.number,
    this.ratioUnitNumber,
    this.currentPrice,
    this.currentNumber,
    this.total,
  });

  ProcessingResponseCalculated.fromJson(Map<String, dynamic> json)
      : packInfo = (json['pack_info'] as Map<String, dynamic>?) != null
            ? ProcessingResponsePackInfo.fromJson(
                json['pack_info'] as Map<String, dynamic>)
            : null,
        rangePriceRatio = json['range_price_ratio'] as int?,
        propertyListInfo = (json['property_list_info'] as List?)
            ?.map((dynamic e) => ProcessingResponsePropertyListInfo.fromJson(
                e as Map<String, dynamic>))
            .toList(),
        propertyPriceRatio = json['property_price_ratio'] as int?,
        discountPriceRatio = json['discount_price_ratio'] as int?,
        priceRatioSum = json['price_ratio_sum'] as int?,
        priceRatioNumber = json['price_ratio_number'] as int?,
        price = json['price'] as int?,
        newPrice = json['new_price'] as int?,
        number = json['number'] as int?,
        ratioUnitNumber = json['ratio_unit_number'] as int?,
        currentPrice = json['current_price'] as int?,
        currentNumber = json['current_number'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
        'pack_info': packInfo?.toJson(),
        'range_price_ratio': rangePriceRatio,
        'property_list_info': propertyListInfo?.map((e) => e.toJson()).toList(),
        'property_price_ratio': propertyPriceRatio,
        'discount_price_ratio': discountPriceRatio,
        'price_ratio_sum': priceRatioSum,
        'price_ratio_number': priceRatioNumber,
        'price': price,
        'new_price': newPrice,
        'number': number,
        'ratio_unit_number': ratioUnitNumber,
        'current_price': currentPrice,
        'current_number': currentNumber,
        'total': total
      };
}

class ProcessingResponsePackInfo {
  final String? name;
  final String? ratioUnit;

  ProcessingResponsePackInfo({
    this.name,
    this.ratioUnit,
  });

  ProcessingResponsePackInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        ratioUnit = json['ratio_unit'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'ratio_unit': ratioUnit};
}

class ProcessingResponsePropertyListInfo {
  final String? id;
  final String? name;
  final String? price;
  final int? inventory;
  final int? minOrder;
  final int? maxOrder;
  final String? propertyName;
  final String? propertyId;

  ProcessingResponsePropertyListInfo({
    this.id,
    this.name,
    this.price,
    this.inventory,
    this.minOrder,
    this.maxOrder,
    this.propertyName,
    this.propertyId,
  });

  ProcessingResponsePropertyListInfo.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        price = json['price'] as String?,
        inventory = json['inventory'] as int?,
        minOrder = json['min_order'] as int?,
        maxOrder = json['max_order'] as int?,
        propertyName = json['property_name'] as String?,
        propertyId = json['property_id'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'price': price,
        'inventory': inventory,
        'min_order': minOrder,
        'max_order': maxOrder,
        'property_name': propertyName,
        'property_id': propertyId
      };
}
