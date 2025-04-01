/// content : [{"id":"597e7e89-dbc1-4295-9774-bd2b721fb402","date":"2025-01-13","fishAmount":200,"weight":200,"pondName":"malkovuy","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"sorted":true,"empty":false,"unsorted":false},"offset":0,"paged":true,"unpaged":false}
/// last : true
/// totalPages : 1
/// totalElements : 1
/// size : 10
/// number : 0
/// sort : {"sorted":true,"empty":false,"unsorted":false}
/// first : true
/// numberOfElements : 1
/// empty : false

class FishDeclinesModel {
  FishDeclinesModel({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
  });

  FishDeclinesModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(FishDecline.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  List<FishDecline>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
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
    map['totalPages'] = totalPages;
    map['totalElements'] = totalElements;
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

/// sorted : true
/// empty : false
/// unsorted : false

class Sort {
  Sort({
    this.sorted,
    this.empty,
    this.unsorted,
  });

  Sort.fromJson(dynamic json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  bool? sorted;
  bool? empty;
  bool? unsorted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sorted'] = sorted;
    map['empty'] = empty;
    map['unsorted'] = unsorted;
    return map;
  }
}

/// pageNumber : 0
/// pageSize : 10
/// sort : {"sorted":true,"empty":false,"unsorted":false}
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

/// sorted : true
/// empty : false
/// unsorted : false

/// id : "597e7e89-dbc1-4295-9774-bd2b721fb402"
/// date : "2025-01-13"
/// fishAmount : 200
/// weight : 200
/// pondName : "malkovuy"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"

class FishDecline {
  FishDecline({
    this.id,
    this.date,
    this.fishAmount,
    this.weight,
    this.pondName,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
  });

  FishDecline.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    fishAmount = json['fishAmount'];
    weight = json['weight'];
    pondName = json['pondName'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }

  String? id;
  String? date;
  int? fishAmount;
  int? weight;
  String? pondName;
  String? fishTypeNameUz;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['fishAmount'] = fishAmount;
    map['weight'] = weight;
    map['pondName'] = pondName;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
    return map;
  }
}
