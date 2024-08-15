/// id : "3559eceb-ed52-4609-abf5-30b321f1e3f9"
/// nameUz : "Toshkent"
/// nameRu : "Тошкент"

class RegionModel {
  RegionModel({
    this.id,
    this.nameUz,
    this.nameRu,
  });

  RegionModel.fromJson(dynamic json) {
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
