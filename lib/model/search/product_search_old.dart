/*
class ProductSearchResponseModel {
  ProductSearchResponseModel({
    ProductSearchData? data,
    String? message,
    bool? error,
    bool? success,
    int? status,
  }) {
    _data = data;
    _message = message;
    _error = error;
    _success = success;
    _status = status;
  }

  ProductSearchResponseModel.fromJson(dynamic json) {
    _data =
        json['data'] != null ? ProductSearchData.fromJson(json['data']) : null;
    _message = json['message'];
    _error = json['error'];
    _success = json['success'];
    _status = json['status'];
  }

  ProductSearchData? _data;
  String? _message;
  bool? _error;
  bool? _success;
  int? _status;

  ProductSearchData? get data => _data;

  String? get message => _message;

  bool? get error => _error;

  bool? get success => _success;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['error'] = _error;
    map['success'] = _success;
    map['status'] = _status;
    return map;
  }
}

class ProductSearchData {
  ProductSearchData({
    int? total,
    int? pages,
    int? limit,
    int? page,
    List<Docs>? docs,
  }) {
    _total = total;
    _pages = pages;
    _limit = limit;
    _page = page;
    _docs = docs;
  }

  ProductSearchData.fromJson(dynamic json) {
    _total = json['total'];
    _pages = json['pages'];
    _limit = json['limit'];
    _page = json['page'];
    if (json['docs'] != null) {
      _docs = [];
      json['docs'].forEach((v) {
        _docs?.add(Docs.fromJson(v));
      });
    }
  }

  int? _total;
  int? _pages;
  int? _limit;
  int? _page;
  List<Docs>? _docs;

  int? get total => _total;

  int? get pages => _pages;

  int? get limit => _limit;

  int? get page => _page;

  List<Docs>? get docs => _docs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['pages'] = _pages;
    map['limit'] = _limit;
    map['page'] = _page;
    if (_docs != null) {
      map['docs'] = _docs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Docs {
  Docs({
    // String? id,
    int? status,
    int? trackingCode,
    String? titleFa,
    String? slugFa,
    String? price,
    int? inventory,
    int? minOrder,
    int? maxOrder,
    List<Images>? images,
    String? createdAt,
    List<Category_list_info>? categoryListInfo,
    Item_id? itemId,
    Branch_id? branchId,
    Shop_id? shopId,
    Seller_id? sellerId,
  }) {
    // _id = id;
    _status = status;
    _trackingCode = trackingCode;
    _titleFa = titleFa;
    _slugFa = slugFa;
    _price = price;
    _inventory = inventory;
    _minOrder = minOrder;
    _maxOrder = maxOrder;
    _images = images;
    _createdAt = createdAt;
    _categoryListInfo = categoryListInfo;
    _itemId = itemId;
    _branchId = branchId;
    _shopId = shopId;
    _sellerId = sellerId;
  }

  Docs.fromJson(dynamic json) {
    // _id = json['_id'];
    _status = json['status'];
    _trackingCode = json['tracking_code'];
    _titleFa = json['title_fa'];
    _slugFa = json['slug_fa'];
    _price = json['price'];
    _inventory = json['inventory'];
    _minOrder = json['min_order'];
    _maxOrder = json['max_order'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    if (json['category_list_info'] != null) {
      _categoryListInfo = [];
      json['category_list_info'].forEach((v) {
        _categoryListInfo?.add(Category_list_info.fromJson(v));
      });
    }
    _itemId = json['item_id'] != null ? Item_id.fromJson(json['itemId']) : null;
    _branchId =
        json['branch_id'] != null ? Branch_id.fromJson(json['branchId']) : null;
    _shopId = json['shop_id'] != null ? Shop_id.fromJson(json['shopId']) : null;
    _sellerId =
        json['seller_id'] != null ? Seller_id.fromJson(json['sellerId']) : null;
  }

  // String? _id;
  int? _status;
  int? _trackingCode;
  String? _titleFa;
  String? _slugFa;
  String? _price;
  int? _inventory;
  int? _minOrder;
  int? _maxOrder;
  List<Images>? _images;
  String? _createdAt;
  List<Category_list_info>? _categoryListInfo;
  Item_id? _itemId;
  Branch_id? _branchId;
  Shop_id? _shopId;
  Seller_id? _sellerId;

  // String? get id => _id;

  int? get status => _status;

  int? get trackingCode => _trackingCode;

  String? get titleFa => _titleFa;

  String? get slugFa => _slugFa;

  String? get price => _price;

  int? get inventory => _inventory;

  int? get minOrder => _minOrder;

  int? get maxOrder => _maxOrder;

  List<Images>? get images => _images;

  String? get createdAt => _createdAt;

  List<Category_list_info>? get categoryListInfo => _categoryListInfo;

  Item_id? get itemId => _itemId;

  Branch_id? get branchId => _branchId;

  Shop_id? get shopId => _shopId;

  Seller_id? get sellerId => _sellerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['_id'] = _id;
    map['status'] = _status;
    map['tracking_code'] = _trackingCode;
    map['title_fa'] = _titleFa;
    map['slug_fa'] = _slugFa;
    map['price'] = _price;
    map['inventory'] = _inventory;
    map['min_order'] = _minOrder;
    map['max_order'] = _maxOrder;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    if (_categoryListInfo != null) {
      map['category_list_info'] =
          _categoryListInfo?.map((v) => v.toJson()).toList();
    }
    if (_itemId != null) {
      map['item_id'] = _itemId?.toJson();
    }
    if (_branchId != null) {
      map['branch_id'] = _branchId?.toJson();
    }
    if (_shopId != null) {
      map['shop_id'] = _shopId?.toJson();
    }
    if (_sellerId != null) {
      map['seller_id'] = _sellerId?.toJson();
    }
    return map;
  }
}

class Seller_id {
  Seller_id({
    String? id,
    int? status,
  }) {
    _id = id;
    _status = status;
  }

  Seller_id.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
  }

  String? _id;
  int? _status;

  String? get id => _id;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    return map;
  }
}

class Shop_id {
  Shop_id({
    String? id,
    int? status,
  }) {
    _id = id;
    _status = status;
  }

  Shop_id.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
  }

  String? _id;
  int? _status;

  String? get id => _id;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    return map;
  }
}

class Branch_id {
  Branch_id({
    String? id,
    int? status,
    String? name,
    bool? isTax,
  }) {
    _id = id;
    _status = status;
    _name = name;
    _isTax = isTax;
  }

  Branch_id.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
    _name = json['name'];
    _isTax = json['is_tax'];
  }

  String? _id;
  int? _status;
  String? _name;
  bool? _isTax;

  String? get id => _id;

  int? get status => _status;

  String? get name => _name;

  bool? get isTax => _isTax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    map['name'] = _name;
    map['is_tax'] = _isTax;
    return map;
  }
}

class Item_id {
  Item_id({
    String? id,
    int? status,
    String? nameFa,
  }) {
    _id = id;
    _status = status;
    _nameFa = nameFa;
  }

  Item_id.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
    _nameFa = json['name_fa'];
  }

  String? _id;
  int? _status;
  String? _nameFa;

  String? get id => _id;

  int? get status => _status;

  String? get nameFa => _nameFa;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    map['name_fa'] = _nameFa;
    return map;
  }
}

class Category_list_info {
  Category_list_info({
    String? id,
    int? status,
    String? titleFa,
  }) {
    _id = id;
    _status = status;
    _titleFa = titleFa;
  }

  Category_list_info.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
    _titleFa = json['title_fa'];
  }

  String? _id;
  int? _status;
  String? _titleFa;

  String? get id => _id;

  int? get status => _status;

  String? get titleFa => _titleFa;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    map['title_fa'] = _titleFa;
    return map;
  }
}

class Images {
  Images({
    String? id,
    String? type,
    String? url,
  }) {
    _id = id;
    _type = type;
    _url = url;
  }

  Images.fromJson(dynamic json) {
    _id = json['_id'];
    _type = json['type'];
    _url = json['url'];
  }

  String? _id;
  String? _type;
  String? _url;

  String? get id => _id;

  String? get type => _type;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['type'] = _type;
    map['url'] = _url;
    return map;
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
