class ProductListByCategoryResponseModel {
  ProductListByCategoryResponseModel({
    List<Data>? data,
    String? message,
    bool? success,
    int? status,
  }) {
    _data = data;
    _message = message;
    _success = success;
    _status = status;
  }

  ProductListByCategoryResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
    _success = json['success'];
    _status = json['status'];
  }

  List<Data>? _data;
  String? _message;
  bool? _success;
  int? _status;

  List<Data>? get data => _data;

  String? get message => _message;

  bool? get success => _success;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['success'] = _success;
    map['status'] = _status;
    return map;
  }
}

class Data {
  Data({
    int? status,
    List<String>? categoryIdList,
    List<String>? colorRange,
    bool? supporting,
    bool? special,
    List<String>? imageList,
    int? likes,
    String? id,
    int? trackingCode,
    String? itemId,
    String? shopId,
    String? branchId,
    String? titleFa,
    String? slugFa,
    String? unit,
    String? price,
    int? inventory,
    int? minOrder,
    int? maxOrder,
    List<String>? propertyList,
    String? createdAt,
    String? updatedAt,
    int? v,
    String? description,
    String? rules,
  }) {
    _status = status;
    _categoryIdList = categoryIdList;
    _colorRange = colorRange;
    _supporting = supporting;
    _special = special;
    _imageList = imageList;
    _likes = likes;
    _id = id;
    _trackingCode = trackingCode;
    _itemId = itemId;
    _shopId = shopId;
    _branchId = branchId;
    _titleFa = titleFa;
    _slugFa = slugFa;
    _unit = unit;
    _price = price;
    _inventory = inventory;
    _minOrder = minOrder;
    _maxOrder = maxOrder;
    _propertyList = propertyList;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _description = description;
    _rules = rules;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _categoryIdList = json['category_id_list'] != null
        ? json['category_id_list'].cast<String>()
        : [];
    _colorRange =
        json['colorRange'] != null ? json['colorRange'].cast<String>() : [];
    _supporting = json['supporting'];
    _special = json['special'];
    _imageList =
        json['image_list'] != null ? json['image_list'].cast<String>() : [];
    _likes = json['likes'];
    _id = json['_id'];
    _trackingCode = json['tracking_code'];
    _itemId = json['item_id'];
    _shopId = json['shop_id'];
    _branchId = json['branch_id'];
    _titleFa = json['title_fa'];
    _slugFa = json['slug_fa'];
    _unit = json['unit'];
    _price = json['price'];
    _inventory = json['inventory'];
    _minOrder = json['min_order'];
    _maxOrder = json['max_order'];
    _propertyList = json['property_list'] != null
        ? json['property_list'].cast<String>()
        : [];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _description = json['description'];
    _rules = json['rules'];
  }

  int? _status;
  List<String>? _categoryIdList;
  List<String>? _colorRange;
  bool? _supporting;
  bool? _special;
  List<String>? _imageList;
  int? _likes;
  String? _id;
  int? _trackingCode;
  String? _itemId;
  String? _shopId;
  String? _branchId;
  String? _titleFa;
  String? _slugFa;
  String? _unit;
  String? _price;
  int? _inventory;
  int? _minOrder;
  int? _maxOrder;
  List<String>? _propertyList;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  String? _description;
  String? _rules;

  int? get status => _status;

  List<String>? get categoryIdList => _categoryIdList;

  List<String>? get colorRange => _colorRange;

  bool? get supporting => _supporting;

  bool? get special => _special;

  List<String>? get imageList => _imageList;

  int? get likes => _likes;

  String? get id => _id;

  int? get trackingCode => _trackingCode;

  String? get itemId => _itemId;

  String? get shopId => _shopId;

  String? get branchId => _branchId;

  String? get titleFa => _titleFa;

  String? get slugFa => _slugFa;

  String? get unit => _unit;

  String? get price => _price;

  int? get inventory => _inventory;

  int? get minOrder => _minOrder;

  int? get maxOrder => _maxOrder;

  List<String>? get propertyList => _propertyList;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get v => _v;

  String? get description => _description;

  String? get rules => _rules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['category_id_list'] = _categoryIdList;
    map['colorRange'] = _colorRange;
    map['supporting'] = _supporting;
    map['special'] = _special;
    map['image_list'] = _imageList;
    map['likes'] = _likes;
    map['_id'] = _id;
    map['tracking_code'] = _trackingCode;
    map['item_id'] = _itemId;
    map['shop_id'] = _shopId;
    map['branch_id'] = _branchId;
    map['title_fa'] = _titleFa;
    map['slug_fa'] = _slugFa;
    map['unit'] = _unit;
    map['price'] = _price;
    map['inventory'] = _inventory;
    map['min_order'] = _minOrder;
    map['max_order'] = _maxOrder;
    map['property_list'] = _propertyList;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['description'] = _description;
    map['rules'] = _rules;
    return map;
  }
}

class ProductListByCategoryRequestModel {
  String token;
  String categoryId;

  ProductListByCategoryRequestModel({
    required this.token,
    required this.categoryId,
  });

  ProductListByCategoryRequestModel.fromJson(Map<String, dynamic> json)
      : token = json['x-access-token'],
        categoryId = json['category_id'];

  Map<String, dynamic> toJson() => {
        "x-access-token": token.trim(),
        "category_id": categoryId.trim(),
      };
}
