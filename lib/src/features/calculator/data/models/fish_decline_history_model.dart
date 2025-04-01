/// content : [{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":200,"declineType":"DEAD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":1000,"declineType":"DEAD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":100,"declineType":"DEAD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":1000,"declineType":"SOLD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":21000,"declineType":"SOLD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":2200,"declineType":"SOLD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":1800,"declineType":"SOLD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":1000,"declineType":"SOLD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":1000,"declineType":"SOLD","newFishAmount":null},{"startWeight":null,"probabilitySurvival":null,"density":null,"oldFishAmount":null,"weight":1000,"declineType":"SOLD","newFishAmount":null}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"sorted":true,"empty":false,"unsorted":false},"offset":0,"paged":true,"unpaged":false}
/// totalPages : 3
/// totalElements : 24
/// last : false
/// size : 10
/// number : 0
/// sort : {"sorted":true,"empty":false,"unsorted":false}
/// numberOfElements : 10
/// first : true
/// empty : false

class FishDeclineHistoryModel {
  FishDeclineHistoryModel({
    this.content,
    this.pageable,
    this.totalPages,
    this.totalElements,
    this.last,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  FishDeclineHistoryModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(FishDeclineHistory.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  List<FishDeclineHistory>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (content != null) {
      map['content'] = content?.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      map['pageable'] = pageable?.toJson();
    }
    map['totalPages'] = totalPages;
    map['totalElements'] = totalElements;
    map['last'] = last;
    map['size'] = size;
    map['number'] = number;
    if (sort != null) {
      map['sort'] = sort?.toJson();
    }
    map['numberOfElements'] = numberOfElements;
    map['first'] = first;
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

/// startWeight : null
/// probabilitySurvival : null
/// density : null
/// oldFishAmount : null
/// weight : 200
/// declineType : "DEAD"
/// newFishAmount : null

class FishDeclineHistory {
  FishDeclineHistory({
    this.startWeight,
    this.probabilitySurvival,
    this.density,
    this.oldFishAmount,
    this.weight,
    this.declineType,
    this.newFishAmount,
  });

  FishDeclineHistory.fromJson(dynamic json) {
    startWeight = json['startWeight'];
    probabilitySurvival = json['probabilitySurvival'];
    density = json['density'];
    oldFishAmount = json['oldFishAmount'];
    weight = json['weight'];
    declineType = json['declineType'];
    newFishAmount = json['newFishAmount'];
  }

  int? startWeight;
  int? probabilitySurvival;
  int? density;
  int? oldFishAmount;
  int? weight;
  String? declineType;
  int? newFishAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startWeight'] = startWeight;
    map['probabilitySurvival'] = probabilitySurvival;
    map['density'] = density;
    map['oldFishAmount'] = oldFishAmount;
    map['weight'] = weight;
    map['declineType'] = declineType;
    map['newFishAmount'] = newFishAmount;
    return map;
  }
}
