/// id : "ee1b30e7-3871-466c-8937-082a26d0468b"
/// nameUz : "Aller Classic"
/// nameRu : "Aller Classic test"

class FoodModel {
  FoodModel({
    this.id,
    this.nameUz,
    this.nameRu,
  });

  FoodModel.fromJson(dynamic json) {
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
