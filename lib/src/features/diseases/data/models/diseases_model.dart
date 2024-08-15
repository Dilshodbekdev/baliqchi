/// content : [{"id":"ceeb024d-20c4-4b36-9eca-6f0b65ed8431","treatmentMethodUz":"<p>f</p>","treatmentMethodRu":"<p>f</p>","nameUz":"ff","nameRu":"f","contentUz":"f","syndromesRu":"<p>f</p>","factorsRu":null,"syndromesUz":"<p>f</p>","contentRu":"f","factorsUz":"<p>f</p>","files":[{"id":"38a702de-78df-4f38-9bcb-220bf33492ab","path":"C:/project/diseases/ceeb024d-20c4-4b36-9eca-6f0b65ed8431/1721901807490Screenshot 2024-04-22 175829.png"}]},{"id":"40b2a064-36ba-4093-a3a6-6ed0c1d3216c","treatmentMethodUz":"<p>v</p>","treatmentMethodRu":"<p>v</p>","nameUz":"tets","nameRu":"tets","contentUz":"tets","syndromesRu":"<p>v</p>","factorsRu":null,"syndromesUz":"<p>v</p>","contentRu":"tets","factorsUz":"<p>vvv</p>","files":[{"id":"e88f4a12-3e3e-459d-8502-fe30a381e98b","path":"C:/project/diseases/40b2a064-36ba-4093-a3a6-6ed0c1d3216c/1721901745101Screenshot 2024-04-22 175829.png"},{"id":"f6f2d219-6862-4b4e-b432-95ddf4544ca3","path":"C:/project/diseases/40b2a064-36ba-4093-a3a6-6ed0c1d3216c/1721901745105Screenshot 2024-04-22 175851.png"}]},{"id":"410b124f-5a98-41d8-b7e1-c87fefefcdd7","treatmentMethodUz":"<p>Test 2</p>","treatmentMethodRu":"<p>Test 2</p>","nameUz":"Test 2","nameRu":"Test 2","contentUz":"Test 2","syndromesRu":"<p>Test 2</p>","factorsRu":null,"syndromesUz":"<p>Test 2</p>","contentRu":"Test 2","factorsUz":"<p>Test 2</p>","files":[{"id":"e88c9364-906a-43a6-938b-1a389d921fbe","path":"C:/project/diseases/410b124f-5a98-41d8-b7e1-c87fefefcdd7/1721717821172Screenshot 2024-05-06 172609.png"},{"id":"9e481f7c-304f-4c6f-a76f-05cb14f17e2e","path":"C:/project/diseases/410b124f-5a98-41d8-b7e1-c87fefefcdd7/1721717821188Screenshot 2024-05-13 150620.png"}]}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"empty":false,"sorted":true,"unsorted":false},"offset":0,"paged":true,"unpaged":false}
/// last : true
/// totalElements : 3
/// totalPages : 1
/// first : true
/// numberOfElements : 3
/// size : 10
/// number : 0
/// sort : {"empty":false,"sorted":true,"unsorted":false}
/// empty : false

class DiseasesModel {
  DiseasesModel({
    this.content,
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.first,
    this.numberOfElements,
    this.size,
    this.number,
    this.sort,
    this.empty,
  });

  DiseasesModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(DiseaseModel.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    empty = json['empty'];
  }

  List<DiseaseModel>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  bool? first;
  int? numberOfElements;
  int? size;
  int? number;
  Sort? sort;
  bool? empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (content != null) {
      map['content'] = content?.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      map['pageable'] = pageable?.toJson();
    }
    map['last'] = last;
    map['totalElements'] = totalElements;
    map['totalPages'] = totalPages;
    map['first'] = first;
    map['numberOfElements'] = numberOfElements;
    map['size'] = size;
    map['number'] = number;
    if (sort != null) {
      map['sort'] = sort?.toJson();
    }
    map['empty'] = empty;
    return map;
  }
}

/// empty : false
/// sorted : true
/// unsorted : false

class Sort {
  Sort({
    this.empty,
    this.sorted,
    this.unsorted,
  });

  Sort.fromJson(dynamic json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  bool? empty;
  bool? sorted;
  bool? unsorted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empty'] = empty;
    map['sorted'] = sorted;
    map['unsorted'] = unsorted;
    return map;
  }
}

/// pageNumber : 0
/// pageSize : 10
/// sort : {"empty":false,"sorted":true,"unsorted":false}
/// offset : 0
/// paged : true
/// unpaged : false

class Pageable {
  Pageable({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.paged,
    this.unpaged,
  });

  Pageable.fromJson(dynamic json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    if (sort != null) {
      map['sort'] = sort?.toJson();
    }
    map['offset'] = offset;
    map['paged'] = paged;
    map['unpaged'] = unpaged;
    return map;
  }
}

/// id : "ceeb024d-20c4-4b36-9eca-6f0b65ed8431"
/// treatmentMethodUz : "<p>f</p>"
/// treatmentMethodRu : "<p>f</p>"
/// nameUz : "ff"
/// nameRu : "f"
/// contentUz : "f"
/// syndromesRu : "<p>f</p>"
/// factorsRu : null
/// syndromesUz : "<p>f</p>"
/// contentRu : "f"
/// factorsUz : "<p>f</p>"
/// files : [{"id":"38a702de-78df-4f38-9bcb-220bf33492ab","path":"C:/project/diseases/ceeb024d-20c4-4b36-9eca-6f0b65ed8431/1721901807490Screenshot 2024-04-22 175829.png"}]

class DiseaseModel {
  DiseaseModel({
    this.id,
    this.treatmentMethodUz,
    this.treatmentMethodRu,
    this.nameUz,
    this.nameRu,
    this.contentUz,
    this.syndromesRu,
    this.factorsRu,
    this.syndromesUz,
    this.contentRu,
    this.factorsUz,
    this.files,
  });

  DiseaseModel.fromJson(dynamic json) {
    id = json['id'];
    treatmentMethodUz = json['treatmentMethodUz'];
    treatmentMethodRu = json['treatmentMethodRu'];
    nameUz = json['nameUz'];
    nameRu = json['nameRu'];
    contentUz = json['contentUz'];
    syndromesRu = json['syndromesRu'];
    factorsRu = json['factorsRu'];
    syndromesUz = json['syndromesUz'];
    contentRu = json['contentRu'];
    factorsUz = json['factorsUz'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
  }

  String? id;
  String? treatmentMethodUz;
  String? treatmentMethodRu;
  String? nameUz;
  String? nameRu;
  String? contentUz;
  String? syndromesRu;
  dynamic factorsRu;
  String? syndromesUz;
  String? contentRu;
  String? factorsUz;
  List<Files>? files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['treatmentMethodUz'] = treatmentMethodUz;
    map['treatmentMethodRu'] = treatmentMethodRu;
    map['nameUz'] = nameUz;
    map['nameRu'] = nameRu;
    map['contentUz'] = contentUz;
    map['syndromesRu'] = syndromesRu;
    map['factorsRu'] = factorsRu;
    map['syndromesUz'] = syndromesUz;
    map['contentRu'] = contentRu;
    map['factorsUz'] = factorsUz;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "38a702de-78df-4f38-9bcb-220bf33492ab"
/// path : "C:/project/diseases/ceeb024d-20c4-4b36-9eca-6f0b65ed8431/1721901807490Screenshot 2024-04-22 175829.png"

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
