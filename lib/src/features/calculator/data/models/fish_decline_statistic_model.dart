/// sold : [{"month":1,"fishAmount":500,"weight":160000,"fishTypeId":"140df7a7-754f-4f1c-a87b-836ebf70ff31","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"},{"month":2,"fishAmount":100,"weight":10000,"fishTypeId":"140df7a7-754f-4f1c-a87b-836ebf70ff31","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"}]
/// dead : [{"month":1,"fishAmount":500,"weight":160000,"fishTypeId":"140df7a7-754f-4f1c-a87b-836ebf70ff31","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"},{"month":2,"fishAmount":100,"weight":10000,"fishTypeId":"140df7a7-754f-4f1c-a87b-836ebf70ff31","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"}]

class FishDeclineStatisticModel {
  FishDeclineStatisticModel({
    this.sold,
    this.dead,
  });

  FishDeclineStatisticModel.fromJson(dynamic json) {
    if (json['sold'] != null) {
      sold = [];
      json['sold'].forEach((v) {
        sold?.add(FishModel.fromJson(v));
      });
    }
    if (json['dead'] != null) {
      dead = [];
      json['dead'].forEach((v) {
        dead?.add(FishModel.fromJson(v));
      });
    }
  }

  List<FishModel>? sold;
  List<FishModel>? dead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sold != null) {
      map['sold'] = sold?.map((v) => v.toJson()).toList();
    }
    if (dead != null) {
      map['dead'] = dead?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// month : 1
/// fishAmount : 500
/// weight : 160000
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"

class FishModel {
  FishModel({
    this.month,
    this.fishAmount,
    this.weight,
    this.fishTypeId,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
  });

  FishModel.fromJson(dynamic json) {
    month = json['month'];
    fishAmount = json['fishAmount'];
    weight = json['weight'];
    fishTypeId = json['fishTypeId'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }

  int? month;
  int? fishAmount;
  int? weight;
  String? fishTypeId;
  String? fishTypeNameUz;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['fishAmount'] = fishAmount;
    map['weight'] = weight;
    map['fishTypeId'] = fishTypeId;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
    return map;
  }
}

/// month : 1
/// fishAmount : 500
/// weight : 160000
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"
