/// content : [{"id":"24f477ab-004d-4fa0-b985-f6fe303d2071","date":"2024-07-29","technologyId":"3df25e8c-8dc4-4672-903d-a1611c4ab4ec","amountFish":0,"fishTypeId":"bf591621-beca-40ba-bc23-71c0eec59503","technologyNames":{"nameUz":"Texnologiya 1","nameRu":"Texnologiya 1"},"fishTypeNames":{"id":"bf591621-beca-40ba-bc23-71c0eec59503","nameUz":"Laqqa","nameRu":"Сом"}},{"id":"ed0dad4d-dc70-40df-ac40-282f9bf1f6ac","date":"2024-07-29","technologyId":"3df25e8c-8dc4-4672-903d-a1611c4ab4ec","amountFish":2,"fishTypeId":"bf591621-beca-40ba-bc23-71c0eec59503","technologyNames":{"nameUz":"Texnologiya 1","nameRu":"Texnologiya 1"},"fishTypeNames":{"id":"bf591621-beca-40ba-bc23-71c0eec59503","nameUz":"Laqqa","nameRu":"Сом"}}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"empty":true,"unsorted":true,"sorted":false},"offset":0,"paged":true,"unpaged":false}
/// last : true
/// totalElements : 2
/// totalPages : 1
/// size : 10
/// number : 0
/// sort : {"empty":true,"unsorted":true,"sorted":false}
/// first : true
/// numberOfElements : 2
/// empty : false

class EconomicsModel {
  EconomicsModel({
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

  EconomicsModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(EconomicModel.fromJson(v));
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

  List<EconomicModel>? content;
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

/// empty : true
/// unsorted : true
/// sorted : false

class Sort {
  Sort({
    this.empty,
    this.unsorted,
    this.sorted,
  });

  Sort.fromJson(dynamic json) {
    empty = json['empty'];
    unsorted = json['unsorted'];
    sorted = json['sorted'];
  }

  bool? empty;
  bool? unsorted;
  bool? sorted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empty'] = empty;
    map['unsorted'] = unsorted;
    map['sorted'] = sorted;
    return map;
  }
}

/// pageNumber : 0
/// pageSize : 10
/// sort : {"empty":true,"unsorted":true,"sorted":false}
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

/// id : "24f477ab-004d-4fa0-b985-f6fe303d2071"
/// date : "2024-07-29"
/// technologyId : "3df25e8c-8dc4-4672-903d-a1611c4ab4ec"
/// amountFish : 0
/// fishTypeId : "bf591621-beca-40ba-bc23-71c0eec59503"
/// technologyNames : {"nameUz":"Texnologiya 1","nameRu":"Texnologiya 1"}
/// fishTypeNames : {"id":"bf591621-beca-40ba-bc23-71c0eec59503","nameUz":"Laqqa","nameRu":"Сом"}

class EconomicModel {
  EconomicModel({
    this.id,
    this.date,
    this.technologyId,
    this.amountFish,
    this.fishTypeId,
    this.technologyNames,
    this.fishTypeNames,
  });

  EconomicModel.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    technologyId = json['technologyId'];
    amountFish = json['amountFish'];
    fishTypeId = json['fishTypeId'];
    technologyNames = json['technologyNames'] != null
        ? TechnologyNames.fromJson(json['technologyNames'])
        : null;
    fishTypeNames = json['fishTypeNames'] != null
        ? FishTypeNames.fromJson(json['fishTypeNames'])
        : null;
  }

  String? id;
  String? date;
  String? technologyId;
  int? amountFish;
  String? fishTypeId;
  TechnologyNames? technologyNames;
  FishTypeNames? fishTypeNames;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['technologyId'] = technologyId;
    map['amountFish'] = amountFish;
    map['fishTypeId'] = fishTypeId;
    if (technologyNames != null) {
      map['technologyNames'] = technologyNames?.toJson();
    }
    if (fishTypeNames != null) {
      map['fishTypeNames'] = fishTypeNames?.toJson();
    }
    return map;
  }
}

/// id : "bf591621-beca-40ba-bc23-71c0eec59503"
/// nameUz : "Laqqa"
/// nameRu : "Сом"

class FishTypeNames {
  FishTypeNames({
    this.id,
    this.nameUz,
    this.nameRu,
  });

  FishTypeNames.fromJson(dynamic json) {
    id = json['id'];
    nameUz = json['nameUz'];
    nameRu = json['nameRu'];
  }

  String? id;
  String? nameUz;
  String? nameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nameUz'] = nameUz;
    map['nameRu'] = nameRu;
    return map;
  }
}

/// nameUz : "Texnologiya 1"
/// nameRu : "Texnologiya 1"

class TechnologyNames {
  TechnologyNames({
    this.nameUz,
    this.nameRu,
  });

  TechnologyNames.fromJson(dynamic json) {
    nameUz = json['nameUz'];
    nameRu = json['nameRu'];
  }

  String? nameUz;
  String? nameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nameUz'] = nameUz;
    map['nameRu'] = nameRu;
    return map;
  }
}
