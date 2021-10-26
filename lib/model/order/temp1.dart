class Temp1 {
  Temp1({
    this.orderList,
  });

  /*Temp1.fromJson(dynamic json) {
    if (json['order_list'] != null) {
      orderList = [];
      json['order_list'].forEach((v) {
        orderList?.add(Order_list.fromJson(v));
      });
    }
  }*/

  List<Order_list>? orderList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orderList != null) {
      map['order_list'] = orderList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Order_list {
  Order_list({
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

  /*Order_list.fromJson(dynamic json) {
    id = json['_id'];
    packId = json['pack_id'];
    number = json['number'];
    if (json['selected_property_id_list'] != null) {
      selectedPropertyIdList = [];
      json['selected_property_id_list'].forEach((v) {
        selectedPropertyIdList?.add(Selected_property_id_list.fromJson(v));
      });
    }
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    province = json['province'];
    city = json['city'];
  }*/

  String? id;
  String? packId;
  int? number;
  List<Selected_property_id_list>? selectedPropertyIdList;
  String? address;
  String? lat;
  String? lon;
  String? province;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['pack_id'] = packId;
    map['number'] = number;
    if (selectedPropertyIdList != null) {
      map['selected_property_id_list'] =
          selectedPropertyIdList?.map((v) => v.toJson()).toList();
    }
    map['address'] = address;
    map['lat'] = lat;
    map['lon'] = lon;
    map['province'] = province;
    map['city'] = city;
    return map;
  }
}

class Selected_property_id_list {
  Selected_property_id_list({
    this.propertyName,
    this.propertyId,
    this.partId,
  });

  Selected_property_id_list.fromJson(dynamic json) {
    propertyName = json['property_name'];
    propertyId = json['property_id'];
    partId = json['part_id'];
  }

  String? propertyName;
  String? propertyId;
  String? partId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_name'] = propertyName;
    map['property_id'] = propertyId;
    map['part_id'] = partId;
    return map;
  }
}
