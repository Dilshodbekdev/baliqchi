/// id : "5e9d5297-2d9f-49a1-b85a-08dda49f1820"
/// paymentDate : "2024-08-13 05:25:00.0"
/// endDate : "2025-08-13 05:25:12.0"
/// price : 10000
/// paymentTypeUz : "yillik"
/// paymentTypeRu : "ежегодно"

class BillingModel {
  BillingModel({
    this.id,
    this.paymentDate,
    this.endDate,
    this.price,
    this.paymentTypeUz,
    this.paymentTypeRu,
  });

  BillingModel.fromJson(dynamic json) {
    id = json['id'];
    paymentDate = json['paymentDate'];
    endDate = json['endDate'];
    price = json['price'];
    paymentTypeUz = json['paymentTypeUz'];
    paymentTypeRu = json['paymentTypeRu'];
  }

  String? id;
  String? paymentDate;
  String? endDate;
  int? price;
  String? paymentTypeUz;
  String? paymentTypeRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['paymentDate'] = paymentDate;
    map['endDate'] = endDate;
    map['price'] = price;
    map['paymentTypeUz'] = paymentTypeUz;
    map['paymentTypeRu'] = paymentTypeRu;
    return map;
  }
}
