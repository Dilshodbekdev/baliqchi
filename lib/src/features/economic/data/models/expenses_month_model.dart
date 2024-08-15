/// content : [{"id":"b7e9e0fe-715e-4db0-8799-238fcb994b46","date":"2024-08-07","expenseTypeId":"82bddd54-9311-4eed-8ddf-009dc5e72c74","expenseName":"string","expenseAmount":1000,"expenseTypeNameUz":"Komunal to'lovlar","expenseTypeNameRu":"Счет за коммунальные услуги"}]
/// pageable : {"pageNumber":0,"pageSize":10,"sort":{"sorted":true,"empty":false,"unsorted":false},"offset":0,"paged":true,"unpaged":false}
/// totalPages : 1
/// totalElements : 1
/// last : true
/// size : 10
/// number : 0
/// sort : {"sorted":true,"empty":false,"unsorted":false}
/// numberOfElements : 1
/// first : true
/// empty : false

class ExpensesMonthModel {
  ExpensesMonthModel({
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

  ExpensesMonthModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(ExpenseMonthModel.fromJson(v));
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

  List<ExpenseMonthModel>? content;
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

/// id : "b7e9e0fe-715e-4db0-8799-238fcb994b46"
/// date : "2024-08-07"
/// expenseTypeId : "82bddd54-9311-4eed-8ddf-009dc5e72c74"
/// expenseName : "string"
/// expenseAmount : 1000
/// expenseTypeNameUz : "Komunal to'lovlar"
/// expenseTypeNameRu : "Счет за коммунальные услуги"

class ExpenseMonthModel {
  ExpenseMonthModel({
    this.id,
    this.date,
    this.expenseTypeId,
    this.expenseName,
    this.expenseAmount,
    this.expenseTypeNameUz,
    this.expenseTypeNameRu,
  });

  ExpenseMonthModel.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    expenseTypeId = json['expenseTypeId'];
    expenseName = json['expenseName'];
    expenseAmount = json['expenseAmount'];
    expenseTypeNameUz = json['expenseTypeNameUz'];
    expenseTypeNameRu = json['expenseTypeNameRu'];
  }

  String? id;
  String? date;
  String? expenseTypeId;
  String? expenseName;
  int? expenseAmount;
  String? expenseTypeNameUz;
  String? expenseTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['expenseTypeId'] = expenseTypeId;
    map['expenseName'] = expenseName;
    map['expenseAmount'] = expenseAmount;
    map['expenseTypeNameUz'] = expenseTypeNameUz;
    map['expenseTypeNameRu'] = expenseTypeNameRu;
    return map;
  }
}
