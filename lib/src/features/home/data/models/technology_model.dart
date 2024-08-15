/// id : "3df25e8c-8dc4-4672-903d-a1611c4ab4ec"
/// nameUz : "Texnologiya "
/// contentRu : "Texnologiya "
/// nameRu : "Texnologiya "
/// contentUz : "Texnologiya "
/// files : [{"id":"36ed206b-f082-4fc9-8bf6-ab53186ea7f3","path":"C:/project/technologies/3df25e8c-8dc4-4672-903d-a1611c4ab4ec/1721995235622Screenshot 2024-04-22 175811.png"},{"id":"92fef214-ba94-476c-9277-9cf9677350a0","path":"C:/project/technologies/3df25e8c-8dc4-4672-903d-a1611c4ab4ec/1721995235638Screenshot 2024-04-22 175839.png"}]

class TechnologyModel {
  TechnologyModel({
    this.id,
    this.nameUz,
    this.contentRu,
    this.nameRu,
    this.contentUz,
    this.files,
  });

  TechnologyModel.fromJson(dynamic json) {
    id = json['id'];
    nameUz = json['nameUz'];
    contentRu = json['contentRu'];
    nameRu = json['nameRu'];
    contentUz = json['contentUz'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
  }

  String? id;
  String? nameUz;
  String? contentRu;
  String? nameRu;
  String? contentUz;
  List<Files>? files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nameUz'] = nameUz;
    map['contentRu'] = contentRu;
    map['nameRu'] = nameRu;
    map['contentUz'] = contentUz;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "36ed206b-f082-4fc9-8bf6-ab53186ea7f3"
/// path : "C:/project/technologies/3df25e8c-8dc4-4672-903d-a1611c4ab4ec/1721995235622Screenshot 2024-04-22 175811.png"

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
