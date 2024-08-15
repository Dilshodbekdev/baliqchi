/// id : "82bddd54-9311-4eed-8ddf-009dc5e72c74"
/// nameUz : "Komunal to'lovlar"
/// nameRu : "Счет за коммунальные услуги"

class ExpenseTypeModel {
  ExpenseTypeModel({
    this.id,
    this.nameUz,
    this.nameRu,
  });

  ExpenseTypeModel.fromJson(dynamic json) {
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
