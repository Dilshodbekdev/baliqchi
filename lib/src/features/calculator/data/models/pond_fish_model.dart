/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"

class PondFishModel {
  PondFishModel({
    this.fishTypeId,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
  });

  PondFishModel.fromJson(dynamic json) {
    fishTypeId = json['fishTypeId'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }

  String? fishTypeId;
  String? fishTypeNameUz;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fishTypeId'] = fishTypeId;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
    return map;
  }
}
