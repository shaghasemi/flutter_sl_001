class CategoryAllModelSaeed {
  CategoryAllModelSaeed({
    this.data,
    this.message,
    this.error,
    this.success,
    this.status,
  });

  CategoryAllModelSaeed.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryAllModelSaeedData.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'];
    success = json['success'];
    status = json['status'];
  }

  List<CategoryAllModelSaeedData>? data;
  String? message;
  bool? error;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['error'] = error;
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class CategoryAllModelSaeedData {
  CategoryAllModelSaeedData({
    this.id,
    this.trackingCode,
    this.status,
    this.titleEn,
    this.titleFa,
    this.slug,
    this.lvl,
    this.subCat1,
  });

  CategoryAllModelSaeedData.fromJson(dynamic json) {
    id = json['_id'];
    trackingCode = json['tracking_code'];
    status = json['status'];
    titleEn = json['title_en'];
    titleFa = json['title_fa'];
    slug = json['slug'];
    lvl = json['lvl'];
    if (json['sub_cat_1'] != null) {
      subCat1 = [];
      json['sub_cat_1'].forEach((v) {
        subCat1?.add(CategoryAllModelSaeedSubOne.fromJson(v));
      });
    }
  }

  String? id;
  int? trackingCode;
  int? status;
  String? titleEn;
  String? titleFa;
  String? slug;
  int? lvl;
  List<CategoryAllModelSaeedSubOne>? subCat1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['tracking_code'] = trackingCode;
    map['status'] = status;
    map['title_en'] = titleEn;
    map['title_fa'] = titleFa;
    map['slug'] = slug;
    map['lvl'] = lvl;
    if (subCat1 != null) {
      map['sub_cat_1'] = subCat1?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CategoryAllModelSaeedSubOne {
  CategoryAllModelSaeedSubOne({
    this.id,
    this.trackingCode,
    this.status,
    this.titleEn,
    this.titleFa,
    this.slug,
    this.lvl,
    this.subCat2,
  });

  CategoryAllModelSaeedSubOne.fromJson(dynamic json) {
    id = json['_id'];
    trackingCode = json['tracking_code'];
    status = json['status'];
    titleEn = json['title_en'];
    titleFa = json['title_fa'];
    slug = json['slug'];
    lvl = json['lvl'];
    if (json['sub_cat_2'] != null) {
      subCat2 = [];
      json['sub_cat_2'].forEach((v) {
        subCat2?.add(CategoryAllModelSaeedSubTwo.fromJson(v));
      });
    }
  }

  String? id;
  int? trackingCode;
  int? status;
  String? titleEn;
  String? titleFa;
  String? slug;
  int? lvl;
  List<CategoryAllModelSaeedSubTwo>? subCat2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['tracking_code'] = trackingCode;
    map['status'] = status;
    map['title_en'] = titleEn;
    map['title_fa'] = titleFa;
    map['slug'] = slug;
    map['lvl'] = lvl;
    if (subCat2 != null) {
      map['sub_cat_2'] = subCat2?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CategoryAllModelSaeedSubTwo {
  CategoryAllModelSaeedSubTwo({
    this.id,
    this.status,
    this.trackingCode,
    this.titleEn,
    this.titleFa,
    this.parentId,
    this.slug,
    this.lvl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  CategoryAllModelSaeedSubTwo.fromJson(dynamic json) {
    id = json['_id'];
    status = json['status'];
    trackingCode = json['tracking_code'];
    titleEn = json['title_en'];
    titleFa = json['title_fa'];
    parentId = json['parent_id'];
    slug = json['slug'];
    lvl = json['lvl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  int? status;
  int? trackingCode;
  String? titleEn;
  String? titleFa;
  String? parentId;
  String? slug;
  int? lvl;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['status'] = status;
    map['tracking_code'] = trackingCode;
    map['title_en'] = titleEn;
    map['title_fa'] = titleFa;
    map['parent_id'] = parentId;
    map['slug'] = slug;
    map['lvl'] = lvl;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class CategoryAllRequestModelSaeed {
  CategoryAllRequestModelSaeed();

  CategoryAllRequestModelSaeed.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => {};
}
