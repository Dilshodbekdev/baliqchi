/// fishName : "string"
/// fishTypeId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// countFish : 0
/// weightFish : 0
/// percentage : 0
/// temperature : "string"
/// foodName : "string"
/// foodTypeId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"

class CreateDailyNutrientBody {
  CreateDailyNutrientBody({
    this.fishName,
    this.fishTypeId,
    this.countFish,
    this.fcr,
    this.weightFish,
    this.percentage,
    this.temperature,
    this.foodName,
    this.foodTypeId,
  });

  CreateDailyNutrientBody.fromJson(dynamic json) {
    fishName = json['fishName'];
    countFish = json['countFish'];
    countFish = json['fcr'];
    weightFish = json['weightFish'];
    percentage = json['percentage'];
    temperature = json['temperature'];
    foodName = json['foodName'];
  }

  String? fishName;
  String? fishTypeId;
  int? countFish;
  double? fcr;
  int? weightFish;
  int? percentage;
  String? temperature;
  String? foodName;
  String? foodTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fishName'] = fishName;
    map['countFish'] = countFish;
    map['weightFish'] = weightFish;
    map['percentage'] = percentage;
    map['temperature'] = temperature;
    map['foodName'] = foodName;
    map['fcr'] = fcr;
    return map;
  }
}
