/// id : "3b684df1-209f-44aa-9815-6c11134b8cd4"
/// price : 5000
/// countMonths : 6
/// paymentTypeUz : "6 oylik"
/// paymentTypeRu : "6 месяцев"

class DefinitionModel {
  DefinitionModel({
    this.id,
    this.price,
    this.countMonths,
    this.paymentTypeUz,
    this.paymentTypeRu,
  });

  DefinitionModel.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    countMonths = json['countMonths'];
    paymentTypeUz = json['paymentTypeUz'];
    paymentTypeRu = json['paymentTypeRu'];
  }

  String? id;
  int? price;
  int? countMonths;
  String? paymentTypeUz;
  String? paymentTypeRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['countMonths'] = countMonths;
    map['paymentTypeUz'] = paymentTypeUz;
    map['paymentTypeRu'] = paymentTypeRu;
    return map;
  }
}
