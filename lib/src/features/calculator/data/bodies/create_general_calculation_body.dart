/// foodPrice : "<integer>"
/// foodTypeName : "<string>"
/// generalNutritionalInfoId : "<uuid>"
/// temperature : "<integer>"
/// pondId : "<uuid>"
/// fishTypeId : "<uuid>"
/// foodTypeId : "<uuid>"

class CreateGeneralCalculationBody {
  CreateGeneralCalculationBody({
    this.foodPrice,
    this.generalNutritionalInfoIds,
    this.temperature,
    this.pondId,
    this.fishTypeId,
    this.foodTypeId,
  });

  CreateGeneralCalculationBody.fromJson(dynamic json) {
    foodPrice = json['foodPrice'];
    generalNutritionalInfoIds = json['generalNutritionalInfoIds'];
    temperature = json['temperature'];
    pondId = json['pondId'];
    fishTypeId = json['fishTypeId'];
    foodTypeId = json['foodTypeId'];
  }

  int? foodPrice;
  List<String>? generalNutritionalInfoIds;
  String? temperature;
  String? pondId;
  String? fishTypeId;
  String? foodTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodPrice'] = foodPrice;
    map['generalNutritionalInfoIds'] = generalNutritionalInfoIds;
    map['temperature'] = temperature;
    map['pondId'] = pondId;
    map['fishTypeId'] = fishTypeId;
    map['foodTypeId'] = foodTypeId;
    return map;
  }
}
