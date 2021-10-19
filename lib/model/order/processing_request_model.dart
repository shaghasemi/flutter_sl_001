class ProcessingRequestModel {
  List<ProcessingRequestOrderList>? orderList;

  ProcessingRequestModel({
    required this.orderList,
  });

  ProcessingRequestModel.fromJson(Map<String, dynamic> json)
      : orderList = (json['order_list'] as List)
            .map((dynamic e) =>
                ProcessingRequestOrderList.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'order_list': orderList?.map((e) => e.toJson()).toList()};
}

class ProcessingRequestOrderList {
  String? id;
  String? packId;
  int? number;
  List<ProcessingRequestSelectedPropertyIdList>? selectedPropertyIdList;
  String? address;
  double? lat;
  double? lon;
  String? province;
  String? city;

  ProcessingRequestOrderList({
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

  ProcessingRequestOrderList.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        packId = json['pack_id'] as String?,
        number = json['number'] as int?,
        selectedPropertyIdList = (json['selected_property_id_list'] as List?)
            ?.map((dynamic e) =>
                ProcessingRequestSelectedPropertyIdList.fromJson(
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

class ProcessingRequestSelectedPropertyIdList {
  String? propertyName;
  String? propertyId;
  String? partId;

  ProcessingRequestSelectedPropertyIdList({
    this.propertyName,
    this.propertyId,
    this.partId,
  });

  ProcessingRequestSelectedPropertyIdList.fromJson(Map<String, dynamic> json)
      : propertyName = json['property_name'] as String?,
        propertyId = json['property_id'] as String?,
        partId = json['part_id'] as String?;

  Map<String, dynamic> toJson() => {
        'property_name': propertyName,
        'property_id': propertyId,
        'part_id': partId
      };
}
