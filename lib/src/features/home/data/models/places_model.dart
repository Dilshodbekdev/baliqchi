/// content : [{"id":"4fb5f700-c6b1-43ce-bf00-3fa79baf1629","titleUz":"Chuqur ko'l","titleRu":"Чукур кул","startDate":"2024-01-03","endDate":"2024-06-01","fee":"Tekin","addressUz":"Navoiy 30","addressRu":"Наваи 30","files":[{"id":"cdb0ae54-5c39-4b41-ba63-4584acd03327","path":"C:/project/places/4fb5f700-c6b1-43ce-bf00-3fa79baf1629/1721368029745image_2022-01-19_17-56-02.png"}]},{"id":"e9147503-55da-44ec-9505-8fd0ec490ce3","titleUz":"To'da ko'l","titleRu":"Туда кул","startDate":"2024-01-03","endDate":"2024-06-01","fee":"Tekin","addressUz":"Navoiy 30","addressRu":"Наваи 30","files":[{"id":"955c9d05-7b09-42d9-b3e0-c798c59ce29f","path":"C:/project/places/e9147503-55da-44ec-9505-8fd0ec490ce3/1721365736535AV.svg"}]},{"id":"e9007d62-2e89-42d1-be6e-92b99c3d2efa","titleUz":"Issiq ko'l","titleRu":"Тёплое озеро","startDate":"2024-01-03","endDate":"2024-06-01","fee":"Tekin","addressUz":"Navoiy 30","addressRu":"Наваи 30","files":[{"id":"34047216-baa1-41e5-9cf1-de9ad41b042d","path":"C:/project/places/e9007d62-2e89-42d1-be6e-92b99c3d2efa/1721300445277AV.svg"}]}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"empty":false,"sorted":true,"unsorted":false},"offset":0,"paged":true,"unpaged":false}
/// last : true
/// totalElements : 3
/// totalPages : 1
/// size : 10
/// number : 0
/// sort : {"empty":false,"sorted":true,"unsorted":false}
/// first : true
/// numberOfElements : 3
/// empty : false

class PlacesModel {
  PlacesModel({
    this.content,
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
  });

  PlacesModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(PlaceModel.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  List<PlaceModel>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  int? size;
  int? number;
  Sort? sort;
  bool? first;
  int? numberOfElements;
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
    map['size'] = size;
    map['number'] = number;
    if (sort != null) {
      map['sort'] = sort?.toJson();
    }
    map['first'] = first;
    map['numberOfElements'] = numberOfElements;
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

/// id : "4fb5f700-c6b1-43ce-bf00-3fa79baf1629"
/// titleUz : "Chuqur ko'l"
/// titleRu : "Чукур кул"
/// startDate : "2024-01-03"
/// endDate : "2024-06-01"
/// fee : "Tekin"
/// addressUz : "Navoiy 30"
/// addressRu : "Наваи 30"
/// files : [{"id":"cdb0ae54-5c39-4b41-ba63-4584acd03327","path":"C:/project/places/4fb5f700-c6b1-43ce-bf00-3fa79baf1629/1721368029745image_2022-01-19_17-56-02.png"}]

class PlaceModel {
  PlaceModel({
    this.id,
    this.titleUz,
    this.titleRu,
    this.startDate,
    this.endDate,
    this.fee,
    this.addressUz,
    this.addressRu,
    this.files,
  });

  PlaceModel.fromJson(dynamic json) {
    id = json['id'];
    titleUz = json['titleUz'];
    titleRu = json['titleRu'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    fee = json['fee'];
    addressUz = json['addressUz'];
    addressRu = json['addressRu'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
  }

  String? id;
  String? titleUz;
  String? titleRu;
  String? startDate;
  String? endDate;
  String? fee;
  String? addressUz;
  String? addressRu;
  List<Files>? files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['titleUz'] = titleUz;
    map['titleRu'] = titleRu;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['fee'] = fee;
    map['addressUz'] = addressUz;
    map['addressRu'] = addressRu;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "cdb0ae54-5c39-4b41-ba63-4584acd03327"
/// path : "C:/project/places/4fb5f700-c6b1-43ce-bf00-3fa79baf1629/1721368029745image_2022-01-19_17-56-02.png"

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
