/// id : "597e7e89-dbc1-4295-9774-bd2b721fb402"
/// date : "2025-01-13"
/// description : "test 23rfwsdf"
/// fishAmount : 200
/// weight : 200
/// pondId : "76522cbd-f03d-4eaf-9254-929e1c4f57b3"
/// declineType : "SOLD"
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// pondName : "malkovuy"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"

class FishDeclineDetailsModel {
  FishDeclineDetailsModel({
    this.id,
    this.date,
    this.description,
    this.fishAmount,
    this.weight,
    this.pondId,
    this.declineType,
    this.fishTypeId,
    this.pondName,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
  });

  FishDeclineDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    description = json['description'];
    fishAmount = json['fishAmount'];
    weight = json['weight'];
    pondId = json['pondId'];
    declineType = json['declineType'];
    fishTypeId = json['fishTypeId'];
    pondName = json['pondName'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }

  String? id;
  String? date;
  String? description;
  int? fishAmount;
  int? weight;
  String? pondId;
  String? declineType;
  String? fishTypeId;
  String? pondName;
  String? fishTypeNameUz;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['description'] = description;
    map['fishAmount'] = fishAmount;
    map['weight'] = weight;
    map['pondId'] = pondId;
    map['declineType'] = declineType;
    map['fishTypeId'] = fishTypeId;
    map['pondName'] = pondName;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
    return map;
  }
}
