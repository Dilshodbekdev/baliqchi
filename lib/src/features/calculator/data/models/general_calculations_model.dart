/// content : [{"id":"f2dc7cbd-89ff-4e48-afbe-382d28e2b4ce","weightInterval":"10 - 50","requiredFood":0.0575999990105629,"fishTypeId":"140df7a7-754f-4f1c-a87b-836ebf70ff31","files":[{"id":"4df1dc8e-4337-4962-80a3-bf38839ef6f0","path":"fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"}],"growthPeriod":21.34533051162729,"totalPrice":691.1999881267548,"foodTypeNameUz":"Aller Classic","foodTypeNameRu":"Aller Classic test","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"},{"id":"8ec68643-dcf4-4503-bf43-33523135f117","weightInterval":"10 - 50","requiredFood":0.0575999990105629,"fishTypeId":"140df7a7-754f-4f1c-a87b-836ebf70ff31","files":[{"id":"4df1dc8e-4337-4962-80a3-bf38839ef6f0","path":"fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"}],"growthPeriod":21.34533051162729,"totalPrice":0.6911999881267548,"foodTypeNameUz":"Aller Classic","foodTypeNameRu":"Aller Classic test","fishTypeNameUz":"Sazan","fishTypeNameRu":"Карп"}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"sorted":true,"empty":false,"unsorted":false},"offset":0,"paged":true,"unpaged":false}
/// last : true
/// totalPages : 1
/// totalElements : 2
/// size : 10
/// number : 0
/// sort : {"sorted":true,"empty":false,"unsorted":false}
/// first : true
/// numberOfElements : 2
/// empty : false

class GeneralCalculationsModel {
  GeneralCalculationsModel({
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

  GeneralCalculationsModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(GeneralCalculation.fromJson(v));
      });
    }
    pageable = json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
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

  List<GeneralCalculation>? content;
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


/// id : "f2dc7cbd-89ff-4e48-afbe-382d28e2b4ce"
/// weightInterval : "10 - 50"
/// requiredFood : 0.0575999990105629
/// fishTypeId : "140df7a7-754f-4f1c-a87b-836ebf70ff31"
/// files : [{"id":"4df1dc8e-4337-4962-80a3-bf38839ef6f0","path":"fishTypes/140df7a7-754f-4f1c-a87b-836ebf70ff31/1724214070334sazan.jpg"}]
/// growthPeriod : 21.34533051162729
/// totalPrice : 691.1999881267548
/// foodTypeNameUz : "Aller Classic"
/// foodTypeNameRu : "Aller Classic test"
/// fishTypeNameUz : "Sazan"
/// fishTypeNameRu : "Карп"

class GeneralCalculation {
  GeneralCalculation({
    this.id,
    this.weightInterval,
    this.requiredFood,
    this.fishTypeId,
    this.files,
    this.growthPeriod,
    this.totalPrice,
    this.foodTypeNameUz,
    this.foodTypeNameRu,
    this.fishTypeNameUz,
    this.fishTypeNameRu,
  });

  GeneralCalculation.fromJson(dynamic json) {
    id = json['id'];
    weightInterval = json['weightInterval'];
    requiredFood = json['requiredFood'];
    fishTypeId = json['fishTypeId'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    growthPeriod = json['growthPeriod'];
    totalPrice = json['totalPrice'];
    foodTypeNameUz = json['foodTypeNameUz'];
    foodTypeNameRu = json['foodTypeNameRu'];
    fishTypeNameUz = json['fishTypeNameUz'];
    fishTypeNameRu = json['fishTypeNameRu'];
  }

  String? id;
  String? weightInterval;
  double? requiredFood;
  String? fishTypeId;
  List<Files>? files;
  double? growthPeriod;
  double? totalPrice;
  String? foodTypeNameUz;
  String? foodTypeNameRu;
  String? fishTypeNameUz;
  String? fishTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['weightInterval'] = weightInterval;
    map['requiredFood'] = requiredFood;
    map['fishTypeId'] = fishTypeId;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['growthPeriod'] = growthPeriod;
    map['totalPrice'] = totalPrice;
    map['foodTypeNameUz'] = foodTypeNameUz;
    map['foodTypeNameRu'] = foodTypeNameRu;
    map['fishTypeNameUz'] = fishTypeNameUz;
    map['fishTypeNameRu'] = fishTypeNameRu;
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
