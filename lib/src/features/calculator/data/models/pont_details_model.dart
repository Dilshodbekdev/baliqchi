/// name : "baliq"
/// length : 40.0
/// id : "12bb5d32-b29e-41f8-ac15-07280e525e64"
/// depth : 2.0
/// fishAmount : 4000
/// startWeight : 100
/// probabilitySurvival : 80
/// density : 40.0
/// volume : 10.0
/// endWeight : 1000
/// hectare : 5.0
/// breadth : 4.0
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// technologyId : "32a2322e-9dc4-4ba7-b0d8-0e03bf0b239c"
/// files : [{"id":"4df1dc8e-4337-4962-80a3-bf38839ef6f0","path":"fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"}]
/// fishTypeNameUz : "Sazan"
/// technologyNameUz : "Yarim intensiv texnologiya"
/// technologyNameRu : "Полуинтенсивная технология"
/// fishTypeNameRu : "Карп"

class PontDetailsModel {
  PontDetailsModel({
      this.name, 
      this.length, 
      this.id, 
      this.depth, 
      this.fishAmount, 
      this.startWeight, 
      this.probabilitySurvival, 
      this.density, 
      this.volume, 
      this.endWeight, 
      this.hectare, 
      this.breadth, 
      this.fishTypeId, 
      this.technologyId, 
      this.files, 
      this.fishTypeNameUz, 
      this.technologyNameUz, 
      this.technologyNameRu, 
      this.fishTypeNameRu,});

  PontDetailsModel.fromJson(dynamic json) {
    name = json['name'];
    length = json['length'];
    id = json['id'];
    depth = json['depth'];
    fishAmount = json['fishAmount'];
    startWeight = json['startWeight'];
    probabilitySurvival = json['probabilitySurvival'];
    density = json['density'];
    volume = json['volume'];
    endWeight = json['endWeight'];
    hectare = json['hectare'];
    breadth = json['breadth'];
    fishTypeId = json['fishTypeId'];
    technologyId = json['technologyId'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    fishTypeNameUz = json['fishTypeNameUz'];
    technologyNameUz = json['technologyNameUz'];
    technologyNameRu = json['technologyNameRu'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }
  String? name;
  double? length;
  String? id;
  double? depth;
  int? fishAmount;
  int? startWeight;
  int? probabilitySurvival;
  double? density;
  double? volume;
  int? endWeight;
  double? hectare;
  double? breadth;
  String? fishTypeId;
  String? technologyId;
  List<Files>? files;
  String? fishTypeNameUz;
  String? technologyNameUz;
  String? technologyNameRu;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['length'] = length;
    map['id'] = id;
    map['depth'] = depth;
    map['fishAmount'] = fishAmount;
    map['startWeight'] = startWeight;
    map['probabilitySurvival'] = probabilitySurvival;
    map['density'] = density;
    map['volume'] = volume;
    map['endWeight'] = endWeight;
    map['hectare'] = hectare;
    map['breadth'] = breadth;
    map['fishTypeId'] = fishTypeId;
    map['technologyId'] = technologyId;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['technologyNameUz'] = technologyNameUz;
    map['technologyNameRu'] = technologyNameRu;
    map['fishTypeNameRu'] = fishTypeNameRu;
    return map;
  }

}

/// id : "4df1dc8e-4337-4962-80a3-bf38839ef6f0"
/// path : "fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"

class Files {
  Files({
      this.id, 
      this.path,});

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