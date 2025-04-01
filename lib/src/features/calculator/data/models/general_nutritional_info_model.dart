/// id : "d4f8cf85-a648-41fe-96a9-102930a73134"
/// weightInterval : "10 - 50"
/// temperature : 24

class GeneralNutritionalInfoModel {
  GeneralNutritionalInfoModel({
    this.id,
    this.startWeight,
    this.endWeight,
    this.temperature,
  });

  GeneralNutritionalInfoModel.fromJson(dynamic json) {
    id = json['id'];
    startWeight = json['startWeight'];
    endWeight = json['endWeight'];
    temperature = json['temperature'];
  }

  String? id;
  int? startWeight;
  int? endWeight;
  int? temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['startWeight'] = startWeight;
    map['endWeight'] = endWeight;
    map['temperature'] = temperature;
    return map;
  }
}
