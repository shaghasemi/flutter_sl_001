class CategoryAllResponseModel {
  CategoryAllResponseModel({
    List<CategoryAllData>? data,
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

  CategoryAllResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryAllData.fromJson(v));
      });
    }
    _message = json['message'];
    _error = json['error'];
    _success = json['success'];
    _status = json['status'];
  }

  List<CategoryAllData>? _data;
  String? _message;
  bool? _error;
  bool? _success;
  int? _status;

  List<CategoryAllData>? get data => _data;

  String? get message => _message;

  bool? get error => _error;

  bool? get success => _success;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['error'] = _error;
    map['success'] = _success;
    map['status'] = _status;
    return map;
  }
}

class CategoryAllData {
  CategoryAllData({
    String? id,
    String? titleFa,
    String? parent_id,
    int? lvl,
  }) {
    _id = id;
    _titleFa = titleFa;
    _lvl = lvl;
  }

  CategoryAllData.fromJson(dynamic json) {
    _id = json['_id'];
    _titleFa = json['title_fa'];
    _parent_id = json['parent_id'];
    _lvl = json['lvl'];
  }

  String? _id;
  String? _titleFa;
  String? _parent_id;
  int? _lvl;

  String? get id => _id;

  String? get titleFa => _titleFa;

  String? get parent_id => _parent_id;

  int? get lvl => _lvl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title_fa'] = _titleFa;
    map['parent_id'] = _parent_id;
    map['lvl'] = _lvl;
    return map;
  }
}

class CategoryAllRequestModel {
  CategoryAllRequestModel();

  CategoryAllRequestModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => {};
}
