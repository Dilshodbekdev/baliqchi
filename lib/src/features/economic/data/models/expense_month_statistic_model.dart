/// expenseTypeId : "82bddd54-9311-4eed-8ddf-009dc5e72c74"
/// expenseAmount : 113093
/// expenseTypeNameUz : "Komunal to'lovlar"
/// expenseTypeNameRu : "Счет за коммунальные услуги"

class ExpenseMonthStatisticModel {
  ExpenseMonthStatisticModel({
    this.expenseTypeId,
    this.expenseAmount,
    this.expenseTypeNameUz,
    this.expenseTypeNameRu,
  });

  ExpenseMonthStatisticModel.fromJson(dynamic json) {
    expenseTypeId = json['expenseTypeId'];
    expenseAmount = json['expenseAmount'];
    expenseTypeNameUz = json['expenseTypeNameUz'];
    expenseTypeNameRu = json['expenseTypeNameRu'];
  }

  String? expenseTypeId;
  int? expenseAmount;
  String? expenseTypeNameUz;
  String? expenseTypeNameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expenseTypeId'] = expenseTypeId;
    map['expenseAmount'] = expenseAmount;
    map['expenseTypeNameUz'] = expenseTypeNameUz;
    map['expenseTypeNameRu'] = expenseTypeNameRu;
    return map;
  }
}
