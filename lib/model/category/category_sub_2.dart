class CategorySubTwoResponseModel {
  CategorySubTwoResponseModel({
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

  CategorySubTwoResponseModel.fromJson(dynamic json) {
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
    String? id,
    int? trackingCode,
    String? titleEn,
    String? titleFa,
    String? parentId,
    String? slug,
    int? lvl,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _status = status;
    _id = id;
    _trackingCode = trackingCode;
    _titleEn = titleEn;
    _titleFa = titleFa;
    _parentId = parentId;
    _slug = slug;
    _lvl = lvl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _id = json['_id'];
    _trackingCode = json['tracking_code'];
    _titleEn = json['title_en'];
    _titleFa = json['title_fa'];
    _parentId = json['parent_id'];
    _slug = json['slug'];
    _lvl = json['lvl'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  int? _status;
  String? _id;
  int? _trackingCode;
  String? _titleEn;
  String? _titleFa;
  String? _parentId;
  String? _slug;
  int? _lvl;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  int? get status => _status;

  String? get id => _id;

  int? get trackingCode => _trackingCode;

  String? get titleEn => _titleEn;

  String? get titleFa => _titleFa;

  String? get parentId => _parentId;

  String? get slug => _slug;

  int? get lvl => _lvl;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['_id'] = _id;
    map['tracking_code'] = _trackingCode;
    map['title_en'] = _titleEn;
    map['title_fa'] = _titleFa;
    map['parent_id'] = _parentId;
    map['slug'] = _slug;
    map['lvl'] = _lvl;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

class CategorySubTwoRequestModel {
  String token;
  int status;
  String parentId;

  CategorySubTwoRequestModel({
    required this.token,
    required this.status,
    required this.parentId,
  });

  CategorySubTwoRequestModel.fromJson(Map<String, dynamic> json)
      : token = json['x-access-token'],
        status = json['status'],
        parentId = json['parent_id'];

  Map<String, dynamic> toJson() => {
        "x-access-token": token.trim(),
        "status": status,
        "parent_id": parentId.trim(),
      };
}
