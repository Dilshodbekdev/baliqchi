/// id : "f2dc7cbd-89ff-4e48-afbe-382d28e2b4ce"
/// weightInterval : "10 - 50"
/// temperature : 24
/// foodTypeId : "ee1b30e7-3871-466c-8937-082a26d0468b"
/// requiredFood : 0.0575999990105629
/// files : [{"id":"4df1dc8e-4337-4962-80a3-bf38839ef6f0","path":"fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"}]
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// estimatedGrowth : 7.539999961853027
/// growthPeriod : 21.34533051162729
/// foodPrice : 100000.0
/// totalPrice : 5759.99990105629
/// generalNutritionalInfoId : "d4f8cf85-a648-41fe-96a9-102930a73134"
/// foodTypeNameUz : "Aller Classic"
/// foodTypeNameRu : "Aller Classic test"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"

class GeneralCalculationDetailsModel {
  GeneralCalculationDetailsModel({
    this.id,
    this.weightInterval,
    this.temperature,
    this.foodTypeId,
    this.requiredFood,
    this.files,
    this.fishTypeId,
    this.estimatedGrowth,
    this.growthPeriod,
    this.foodPrice,
    this.totalPrice,
    this.generalNutritionalInfoId,
    this.foodTypeNameUz,
    this.foodTypeNameRu,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
  });

  GeneralCalculationDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    weightInterval = json['weightInterval'];
    temperature = json['temperature'];
    foodTypeId = json['foodTypeId'];
    requiredFood = json['requiredFood'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    fishTypeId = json['fishTypeId'];
    estimatedGrowth = json['estimatedGrowth'];
    growthPeriod = json['growthPeriod'];
    foodPrice = json['foodPrice'];
    totalPrice = json['totalPrice'];
    generalNutritionalInfoId = json['generalNutritionalInfoId'];
    foodTypeNameUz = json['foodTypeNameUz'];
    foodTypeNameRu = json['foodTypeNameRu'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }

  String? id;
  String? weightInterval;
  int? temperature;
  String? foodTypeId;
  double? requiredFood;
  List<Files>? files;
  String? fishTypeId;
  double? estimatedGrowth;
  double? growthPeriod;
  double? foodPrice;
  double? totalPrice;
  String? generalNutritionalInfoId;
  String? foodTypeNameUz;
  String? foodTypeNameRu;
  String? fishTypeNameUz;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['weightInterval'] = weightInterval;
    map['temperature'] = temperature;
    map['foodTypeId'] = foodTypeId;
    map['requiredFood'] = requiredFood;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['fishTypeId'] = fishTypeId;
    map['estimatedGrowth'] = estimatedGrowth;
    map['growthPeriod'] = growthPeriod;
    map['foodPrice'] = foodPrice;
    map['totalPrice'] = totalPrice;
    map['generalNutritionalInfoId'] = generalNutritionalInfoId;
    map['foodTypeNameUz'] = foodTypeNameUz;
    map['foodTypeNameRu'] = foodTypeNameRu;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
    return map;
  }
}

/// id : "4df1dc8e-4337-4962-80a3-bf38839ef6f0"
/// path : "fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"

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
