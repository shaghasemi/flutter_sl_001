class PanelOrderResponseModel {
  PanelOrderResponseData? data;
  bool? error;
  String? message;
  int? status;
  bool? success;

  PanelOrderResponseModel(
      {this.data, this.error, this.message, this.status, this.success});

  factory PanelOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return PanelOrderResponseModel(
      data: json['data'] != null
          ? PanelOrderResponseData.fromJson(json['data'])
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

class PanelOrderResponseData {
  List<Doc>? docs;
  int? limit;
  int? page;
  int? pages;
  int? total;

  PanelOrderResponseData(
      {this.docs, this.limit, this.page, this.pages, this.total});

  factory PanelOrderResponseData.fromJson(Map<String, dynamic> json) {
    return PanelOrderResponseData(
      docs: json['docs'] != null
          ? (json['docs'] as List).map((i) => Doc.fromJson(i)).toList()
          : null,
      limit: json['limit'],
      page: json['page'],
      pages: json['pages'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['pages'] = this.pages;
    data['total'] = this.total;
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doc {
  int? cart_id;
  int? count;
  String? createdAt;
  List<X>? list;

  Doc({this.cart_id, this.count, this.createdAt, this.list});

  factory Doc.fromJson(Map<String, dynamic> json) {
    return Doc(
      cart_id: json['cart_id'],
      count: json['count'],
      createdAt: json['createdAt'],
      list: json['list'] != null
          ? (json['list'] as List).map((i) => X.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cart_id;
    data['count'] = this.count;
    data['createdAt'] = this.createdAt;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class X {
  String? id;
  String? address;
  BranchInfo? branch_info;
  String? other_price;
  List<PaymentInfo>? payment_info;
  ProductInfo? product_info;
  ShopInfo? shop_info;
  int? status;
  int? tracking_code;
  String? transport_price;
  int? type;

  X(
      {this.id,
      this.address,
      this.branch_info,
      this.other_price,
      this.payment_info,
      this.product_info,
      this.shop_info,
      this.status,
      this.tracking_code,
      this.transport_price,
      this.type});

  factory X.fromJson(Map<String, dynamic> json) {
    return X(
      id: json['_id'],
      address: json['address'],
      branch_info: json['branch_info'] != null
          ? BranchInfo.fromJson(json['branch_info'])
          : null,
      other_price: json['other_price'],
      payment_info: json['payment_info'] != null
          ? (json['payment_info'] as List)
              .map((i) => PaymentInfo.fromJson(i))
              .toList()
          : null,
      product_info: json['product_info'] != null
          ? ProductInfo.fromJson(json['product_info'])
          : null,
      shop_info: json['shop_info'] != null
          ? ShopInfo.fromJson(json['shop_info'])
          : null,
      status: json['status'],
      tracking_code: json['tracking_code'],
      transport_price: json['transport_price'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['address'] = this.address;
    data['other_price'] = this.other_price;
    data['status'] = this.status;
    data['tracking_code'] = this.tracking_code;
    data['transport_price'] = this.transport_price;
    data['type'] = this.type;
    if (this.branch_info != null) {
      data['branch_info'] = this.branch_info!.toJson();
    }
    if (this.payment_info != null) {
      data['payment_info'] = this.payment_info!.map((v) => v.toJson()).toList();
    }
    if (this.product_info != null) {
      data['product_info'] = this.product_info!.toJson();
    }
    if (this.shop_info != null) {
      data['shop_info'] = this.shop_info!.toJson();
    }
    return data;
  }
}

class ShopInfo {
  String? id;
  String? commercial_name;

  ShopInfo({this.id, this.commercial_name});

  factory ShopInfo.fromJson(Map<String, dynamic> json) {
    return ShopInfo(
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

class PaymentInfo {
  String? id;
  int? amount;
  int? status;
  int? tracking_code;

  PaymentInfo({this.id, this.amount, this.status, this.tracking_code});

  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      id: json['_id'],
      amount: json['amount'],
      status: json['status'],
      tracking_code: json['tracking_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['tracking_code'] = this.tracking_code;
    return data;
  }
}

class ProductInfo {
  String? id;
  Image? image;
  String? price;
  String? title_en;
  String? title_fa;

  ProductInfo({this.id, this.image, this.price, this.title_en, this.title_fa});

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      id: json['_id'],
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
      price: json['price'],
      title_en: json['title_en'],
      title_fa: json['title_fa'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['price'] = this.price;
    data['title_en'] = this.title_en;
    data['title_fa'] = this.title_fa;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
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

class BranchInfo {
  String? id;
  bool? is_tax;
  String? name;

  BranchInfo({this.id, this.is_tax, this.name});

  factory BranchInfo.fromJson(Map<String, dynamic> json) {
    return BranchInfo(
      id: json['_id'],
      is_tax: json['is_tax'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['is_tax'] = this.is_tax;
    data['name'] = this.name;
    return data;
  }
}

class PanelOrderRequestModel {
  String token; // Main Entry
  int page;
  int limit;

  PanelOrderRequestModel({
    required this.token,
    required this.page,
    required this.limit,
  });

  PanelOrderRequestModel.fromJson(Map<String, dynamic> json)
      : token = json['x-access-token'],
        page = json['page'],
        limit = json['limit'];

  Map<String, dynamic> toJson() => {
        "x-access-token": token,
        "page": page,
        "limit": limit,
      };
}
