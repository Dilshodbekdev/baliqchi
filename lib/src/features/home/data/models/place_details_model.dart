/// id : "4fb5f700-c6b1-43ce-bf00-3fa79baf1629"
/// contentRu : "Рыбацкий курорт 'Чукур кул' может стать отличным выбором для туристов и любителей рыбалки."
/// contentUz : "Chuqur ko'l baliq ovlash maskani sayyohlar va baliq ovi ixlosmandlari uchun ajoyib tanlov bo'la oladi."
/// startDate : "2024-01-03"
/// free : false
/// fishTypes : [{"id":"171dcd52-c8ac-4ffe-877c-86f55f4a5ac0","nameUz":"Sazan","nameRu":"Сазан"},{"id":"bf591621-beca-40ba-bc23-71c0eec59503","nameUz":"Laqqa","nameRu":"Сом"}]
/// titleUz : "Chuqur ko'l"
/// endDate : "2024-06-01"
/// titleRu : "Чукур кул"
/// addressRu : null
/// fee : "200000"
/// addressUz : null
/// files : [{"id":"cdb0ae54-5c39-4b41-ba63-4584acd03327","path":"C:/project/places/4fb5f700-c6b1-43ce-bf00-3fa79baf1629/1721368029745image_2022-01-19_17-56-02.png"}]

class PlaceDetailsModel {
  PlaceDetailsModel({
    this.id,
    this.contentRu,
    this.contentUz,
    this.startDate,
    this.free,
    this.fishTypes,
    this.titleUz,
    this.endDate,
    this.titleRu,
    this.addressRu,
    this.fee,
    this.addressUz,
    this.files,
  });

  PlaceDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    contentRu = json['contentRu'];
    contentUz = json['contentUz'];
    startDate = json['startDate'];
    free = json['free'];
    if (json['fishTypes'] != null) {
      fishTypes = [];
      json['fishTypes'].forEach((v) {
        fishTypes?.add(FishTypes.fromJson(v));
      });
    }
    titleUz = json['titleUz'];
    endDate = json['endDate'];
    titleRu = json['titleRu'];
    addressRu = json['addressRu'];
    fee = json['fee'];
    addressUz = json['addressUz'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
  }

  String? id;
  String? contentRu;
  String? contentUz;
  String? startDate;
  bool? free;
  List<FishTypes>? fishTypes;
  String? titleUz;
  String? endDate;
  String? titleRu;
  String? addressRu;
  String? fee;
  String? addressUz;
  List<Files>? files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['contentRu'] = contentRu;
    map['contentUz'] = contentUz;
    map['startDate'] = startDate;
    map['free'] = free;
    if (fishTypes != null) {
      map['fishTypes'] = fishTypes?.map((v) => v.toJson()).toList();
    }
    map['titleUz'] = titleUz;
    map['endDate'] = endDate;
    map['titleRu'] = titleRu;
    map['addressRu'] = addressRu;
    map['fee'] = fee;
    map['addressUz'] = addressUz;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "cdb0ae54-5c39-4b41-ba63-4584acd03327"
/// path : "C:/project/places/4fb5f700-c6b1-43ce-bf00-3fa79baf1629/1721368029745image_2022-01-19_17-56-02.png"

class Files {
  Files({
    this.id,
    this.path,
  });

  Files.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
  }

  String? id;
  String? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    return map;
  }
}

/// id : "171dcd52-c8ac-4ffe-877c-86f55f4a5ac0"
/// nameUz : "Sazan"
/// nameRu : "Сазан"

class FishTypes {
  FishTypes({
    this.id,
    this.nameUz,
    this.nameRu,
  });

  FishTypes.fromJson(dynamic json) {
    id = json['id'];
    nameUz = json['nameUz'];
    nameRu = json['nameRu'];
  }

  String? id;
  String? nameUz;
  String? nameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nameUz'] = nameUz;
    map['nameRu'] = nameRu;
    return map;
  }
}
