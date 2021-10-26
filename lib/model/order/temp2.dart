class Temp2 {
  Temp2({
    // List<Data>? data,
    String? message,
    bool? error,
    bool? success,
    int? status,
  }) {
    // _data = data;
    _message = message;
    _error = error;
    _success = success;
    _status = status;
  }

  Temp2.fromJson(dynamic json) {
    /*if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }*/
    _message = json['message'];
    _error = json['error'];
    _success = json['success'];
    _status = json['status'];
  }

  // List<Data>? _data;
  String? _message;
  bool? _error;
  bool? _success;
  int? _status;

  // List<Data>? get data => _data;

  String? get message => _message;

  bool? get error => _error;

  bool? get success => _success;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    /*if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }*/
    map['message'] = _message;
    map['error'] = _error;
    map['success'] = _success;
    map['status'] = _status;
    return map;
  }
}

/*
class Data {
  Data({
    Order? order,
    Product? product,
    Calculated? calculated,
  }) {
    _order = order;
    _product = product;
    _calculated = calculated;
  }

  Data.fromJson(dynamic json) {
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    _product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    _calculated = json['calculated'] != null
        ? Calculated.fromJson(json['calculated'])
        : null;
  }

  Order? _order;
  Product? _product;
  Calculated? _calculated;

  Order? get order => _order;

  Product? get product => _product;

  Calculated? get calculated => _calculated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_calculated != null) {
      map['calculated'] = _calculated?.toJson();
    }
    return map;
  }
}

class Calculated {
  Calculated({
    Pack_info? packInfo,
    int? rangePriceRatio,
    dynamic propertyListInfo,
    int? propertyPriceRatio,
    int? discountPriceRatio,
    int? priceRatioSum,
    int? priceRatioNumber,
    int? price,
    int? newPrice,
    int? number,
    int? ratioUnitNumber,
    int? currentPrice,
    int? currentNumber,
    int? total,
  }) {
    _packInfo = packInfo;
    _rangePriceRatio = rangePriceRatio;
    _propertyListInfo = propertyListInfo;
    _propertyPriceRatio = propertyPriceRatio;
    _discountPriceRatio = discountPriceRatio;
    _priceRatioSum = priceRatioSum;
    _priceRatioNumber = priceRatioNumber;
    _price = price;
    _newPrice = newPrice;
    _number = number;
    _ratioUnitNumber = ratioUnitNumber;
    _currentPrice = currentPrice;
    _currentNumber = currentNumber;
    _total = total;
  }

  Calculated.fromJson(dynamic json) {
    _packInfo =
        json['pack_info'] != null ? Pack_info.fromJson(json['packInfo']) : null;
    _rangePriceRatio = json['range_price_ratio'];
    _propertyListInfo = json['property_list_info'];
    _propertyPriceRatio = json['property_price_ratio'];
    _discountPriceRatio = json['discount_price_ratio'];
    _priceRatioSum = json['price_ratio_sum'];
    _priceRatioNumber = json['price_ratio_number'];
    _price = json['price'];
    _newPrice = json['new_price'];
    _number = json['number'];
    _ratioUnitNumber = json['ratio_unit_number'];
    _currentPrice = json['current_price'];
    _currentNumber = json['current_number'];
    _total = json['total'];
  }

  Pack_info? _packInfo;
  int? _rangePriceRatio;
  dynamic _propertyListInfo;
  int? _propertyPriceRatio;
  int? _discountPriceRatio;
  int? _priceRatioSum;
  int? _priceRatioNumber;
  int? _price;
  int? _newPrice;
  int? _number;
  int? _ratioUnitNumber;
  int? _currentPrice;
  int? _currentNumber;
  int? _total;

  Pack_info? get packInfo => _packInfo;

  int? get rangePriceRatio => _rangePriceRatio;

  dynamic get propertyListInfo => _propertyListInfo;

  int? get propertyPriceRatio => _propertyPriceRatio;

  int? get discountPriceRatio => _discountPriceRatio;

  int? get priceRatioSum => _priceRatioSum;

  int? get priceRatioNumber => _priceRatioNumber;

  int? get price => _price;

  int? get newPrice => _newPrice;

  int? get number => _number;

  int? get ratioUnitNumber => _ratioUnitNumber;

  int? get currentPrice => _currentPrice;

  int? get currentNumber => _currentNumber;

  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_packInfo != null) {
      map['pack_info'] = _packInfo?.toJson();
    }
    map['range_price_ratio'] = _rangePriceRatio;
    map['property_list_info'] = _propertyListInfo;
    map['property_price_ratio'] = _propertyPriceRatio;
    map['discount_price_ratio'] = _discountPriceRatio;
    map['price_ratio_sum'] = _priceRatioSum;
    map['price_ratio_number'] = _priceRatioNumber;
    map['price'] = _price;
    map['new_price'] = _newPrice;
    map['number'] = _number;
    map['ratio_unit_number'] = _ratioUnitNumber;
    map['current_price'] = _currentPrice;
    map['current_number'] = _currentNumber;
    map['total'] = _total;
    return map;
  }
}

class Pack_info {
  Pack_info({
    String? name,
    String? ratioUnit,
  }) {
    _name = name;
    _ratioUnit = ratioUnit;
  }

  Pack_info.fromJson(dynamic json) {
    _name = json['name'];
    _ratioUnit = json['ratio_unit'];
  }

  String? _name;
  String? _ratioUnit;

  String? get name => _name;

  String? get ratioUnit => _ratioUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['ratio_unit'] = _ratioUnit;
    return map;
  }
}

class Product {
  Product({
    int? status,
    String? titleEn,
    bool? supporting,
    bool? returning,
    String? marketerCommission,
    String? id,
    Shop_id? shopId,
    Branch_id? branchId,
    String? titleFa,
    String? unit,
    int? inventory,
    int? minOrder,
    int? maxOrder,
    String? description,
    String? rules,
    String? images,
  }) {
    _status = status;
    _titleEn = titleEn;
    _supporting = supporting;
    _returning = returning;
    _marketerCommission = marketerCommission;
    _id = id;
    _shopId = shopId;
    _branchId = branchId;
    _titleFa = titleFa;
    _unit = unit;
    _inventory = inventory;
    _minOrder = minOrder;
    _maxOrder = maxOrder;
    _description = description;
    _rules = rules;
    _images = images;
  }

  Product.fromJson(dynamic json) {
    _status = json['status'];
    _titleEn = json['title_en'];
    _supporting = json['supporting'];
    _returning = json['returning'];
    _marketerCommission = json['marketer_commission'];
    _id = json['_id'];
    _shopId = json['shop_id'] != null ? Shop_id.fromJson(json['shopId']) : null;
    _branchId =
        json['branch_id'] != null ? Branch_id.fromJson(json['branchId']) : null;
    _titleFa = json['title_fa'];
    _unit = json['unit'];
    _inventory = json['inventory'];
    _minOrder = json['min_order'];
    _maxOrder = json['max_order'];
    _description = json['description'];
    _rules = json['rules'];
    _images = json['images'];
  }

  int? _status;
  String? _titleEn;
  bool? _supporting;
  bool? _returning;
  String? _marketerCommission;
  String? _id;
  Shop_id? _shopId;
  Branch_id? _branchId;
  String? _titleFa;
  String? _unit;
  int? _inventory;
  int? _minOrder;
  int? _maxOrder;
  String? _description;
  String? _rules;
  String? _images;

  int? get status => _status;

  String? get titleEn => _titleEn;

  bool? get supporting => _supporting;

  bool? get returning => _returning;

  String? get marketerCommission => _marketerCommission;

  String? get id => _id;

  Shop_id? get shopId => _shopId;

  Branch_id? get branchId => _branchId;

  String? get titleFa => _titleFa;

  String? get unit => _unit;

  int? get inventory => _inventory;

  int? get minOrder => _minOrder;

  int? get maxOrder => _maxOrder;

  String? get description => _description;

  String? get rules => _rules;

  String? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['title_en'] = _titleEn;
    map['supporting'] = _supporting;
    map['returning'] = _returning;
    map['marketer_commission'] = _marketerCommission;
    map['_id'] = _id;
    if (_shopId != null) {
      map['shop_id'] = _shopId?.toJson();
    }
    if (_branchId != null) {
      map['branch_id'] = _branchId?.toJson();
    }
    map['title_fa'] = _titleFa;
    map['unit'] = _unit;
    map['inventory'] = _inventory;
    map['min_order'] = _minOrder;
    map['max_order'] = _maxOrder;
    map['description'] = _description;
    map['rules'] = _rules;
    map['images'] = _images;
    return map;
  }
}

class Branch_id {
  Branch_id({
    String? name,
    String? id,
    int? status,
  }) {
    _name = name;
    _id = id;
    _status = status;
  }

  Branch_id.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['_id'];
    _status = json['status'];
  }

  String? _name;
  String? _id;
  int? _status;

  String? get name => _name;

  String? get id => _id;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['_id'] = _id;
    map['status'] = _status;
    return map;
  }
}

class Shop_id {
  Shop_id({
    String? commercialName,
    String? id,
    int? status,
  }) {
    _commercialName = commercialName;
    _id = id;
    _status = status;
  }

  Shop_id.fromJson(dynamic json) {
    _commercialName = json['commercial_name'];
    _id = json['_id'];
    _status = json['status'];
  }

  String? _commercialName;
  String? _id;
  int? _status;

  String? get commercialName => _commercialName;

  String? get id => _id;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['commercial_name'] = _commercialName;
    map['_id'] = _id;
    map['status'] = _status;
    return map;
  }
}

class Order {
  Order({
    String? id,
    String? packId,
    int? number,
    dynamic selectedPropertyIdList,
    String? address,
    String? lat,
    String? lon,
    String? province,
    String? city,
  }) {
    _id = id;
    _packId = packId;
    _number = number;
    _selectedPropertyIdList = selectedPropertyIdList;
    _address = address;
    _lat = lat;
    _lon = lon;
    _province = province;
    _city = city;
  }

  Order.fromJson(dynamic json) {
    _id = json['_id'];
    _packId = json['pack_id'];
    _number = json['number'];
    _selectedPropertyIdList = json['selected_property_id_list'];
    _address = json['address'];
    _lat = json['lat'];
    _lon = json['lon'];
    _province = json['province'];
    _city = json['city'];
  }

  String? _id;
  String? _packId;
  int? _number;
  dynamic _selectedPropertyIdList;
  String? _address;
  String? _lat;
  String? _lon;
  String? _province;
  String? _city;

  String? get id => _id;

  String? get packId => _packId;

  int? get number => _number;

  dynamic get selectedPropertyIdList => _selectedPropertyIdList;

  String? get address => _address;

  String? get lat => _lat;

  String? get lon => _lon;

  String? get province => _province;

  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['pack_id'] = _packId;
    map['number'] = _number;
    map['selected_property_id_list'] = _selectedPropertyIdList;
    map['address'] = _address;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['province'] = _province;
    map['city'] = _city;
    return map;
  }
}
*/
