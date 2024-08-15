/// expenseTypeId : "82bddd54-9311-4eed-8ddf-009dc5e72c74"
/// expenseName : "string"
/// expenseAmount : 1000
/// date : "2024-08-07"

class ExpenseMonthBody {
  ExpenseMonthBody({
    this.expenseTypeId,
    this.expenseName,
    this.expenseAmount,
    this.date,
  });

  ExpenseMonthBody.fromJson(dynamic json) {
    expenseTypeId = json['expenseTypeId'];
    expenseName = json['expenseName'];
    expenseAmount = json['expenseAmount'];
    date = json['date'];
  }

  String? expenseTypeId;
  String? expenseName;
  int? expenseAmount;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expenseTypeId'] = expenseTypeId;
    map['expenseName'] = expenseName;
    map['expenseAmount'] = expenseAmount;
    map['date'] = date;
    return map;
  }
}
