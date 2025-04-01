/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// technologyId : "32a2322e-9dc4-4ba7-b0d8-0e03bf0b239c"
/// name : "<string>"
/// hectare : "12.0"
/// depth : "12.0"
/// breadth : "12.0"
/// length : "12.0"
/// fishAmount : "12"
/// startWeight : "12"
/// probabilitySurvival : "12"
/// endWeight : "12"

class CreatePondBody {
  CreatePondBody({
    this.fishTypeId,
    this.technologyId,
    this.name,
    this.hectare,
    this.depth,
    this.breadth,
    this.length,
    this.fishAmount,
    this.startWeight,
    this.probabilitySurvival,
    this.endWeight,
    this.id,
  });

  CreatePondBody.fromJson(dynamic json) {
    fishTypeId = json['fishTypeId'];
    technologyId = json['technologyId'];
    name = json['name'];
    hectare = json['hectare'];
    depth = json['depth'];
    breadth = json['breadth'];
    length = json['length'];
    fishAmount = json['fishAmount'];
    startWeight = json['startWeight'];
    probabilitySurvival = json['probabilitySurvival'];
    endWeight = json['endWeight'];
  }

  String? fishTypeId;
  String? technologyId;
  String? name;
  double? hectare;
  double? depth;
  double? breadth;
  double? length;
  int? fishAmount;
  int? startWeight;
  int? probabilitySurvival;
  int? endWeight;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fishTypeId'] = fishTypeId;
    map['technologyId'] = technologyId;
    map['name'] = name;
    map['hectare'] = hectare;
    map['depth'] = depth;
    map['breadth'] = breadth;
    map['length'] = length;
    map['fishAmount'] = fishAmount;
    map['startWeight'] = startWeight;
    map['probabilitySurvival'] = probabilitySurvival;
    map['endWeight'] = endWeight;
    return map;
  }
}
