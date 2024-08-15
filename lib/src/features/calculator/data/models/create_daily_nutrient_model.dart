/// countFish : 10
/// weightFish : 10
/// percentage : 0.0
/// fishName : "string"
/// foodName : "string"
/// nutrientValue : 0.0
/// temperature : "string"

class CreateDailyNutrientModel {
  CreateDailyNutrientModel({
    this.countFish,
    this.weightFish,
    this.percentage,
    this.fishName,
    this.foodName,
    this.nutrientValue,
    this.temperature,
  });

  CreateDailyNutrientModel.fromJson(dynamic json) {
    countFish = json['countFish'];
    weightFish = json['weightFish'];
    percentage = json['percentage'];
    fishName = json['fishName'];
    foodName = json['foodName'];
    nutrientValue = json['nutrientValue'];
    temperature = json['temperature'];
  }

  int? countFish;
  int? weightFish;
  double? percentage;
  String? fishName;
  String? foodName;
  double? nutrientValue;
  String? temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countFish'] = countFish;
    map['weightFish'] = weightFish;
    map['percentage'] = percentage;
    map['fishName'] = fishName;
    map['foodName'] = foodName;
    map['nutrientValue'] = nutrientValue;
    map['temperature'] = temperature;
    return map;
  }
}
