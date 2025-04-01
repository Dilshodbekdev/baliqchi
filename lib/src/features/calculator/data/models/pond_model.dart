/// name : "<string>"
/// id : "2e04326d-274d-4a18-b02e-52fc3e67a01f"
/// fishAmount : 12
/// files : [{"id":"4df1dc8e-4337-4962-80a3-bf38839ef6f0","path":"fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"}]
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"
/// technologyNameUz : "Yarim intensiv texnologiya"
/// technologyNameRu : "Полуинтенсивная технология"

class PondModel {
  PondModel({
    this.name,
    this.id,
    this.fishAmount,
    this.files,
    this.fishTypeId,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
    this.technologyNameUz,
    this.technologyNameRu,
  });

  PondModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    fishAmount = json['fishAmount'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    fishTypeId = json['fishTypeId'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
    technologyNameUz = json['technologyNameUz'];
    technologyNameRu = json['technologyNameRu'];
  }

  String? name;
  String? id;
  int? fishAmount;
  List<Files>? files;
  String? fishTypeId;
  String? fishTypeNameUz;
  String? fishTypeNameRu;
  String? technologyNameUz;
  String? technologyNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['fishAmount'] = fishAmount;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['fishTypeId'] = fishTypeId;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
    map['technologyNameUz'] = technologyNameUz;
    map['technologyNameRu'] = technologyNameRu;
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
