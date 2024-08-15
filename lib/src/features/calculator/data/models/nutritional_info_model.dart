/// id : "92f43916-7be4-4ebb-a04a-b3e5d8cdd2cc"
/// percentage : 0
/// temperature : "8-12"

class NutritionalInfoModel {
  NutritionalInfoModel({
    this.id,
    this.percentage,
    this.temperature,
  });

  NutritionalInfoModel.fromJson(dynamic json) {
    id = json['id'];
    percentage = json['percentage'];
    temperature = json['temperature'];
  }

  String? id;
  int? percentage;
  String? temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['percentage'] = percentage;
    map['temperature'] = temperature;
    return map;
  }
}
