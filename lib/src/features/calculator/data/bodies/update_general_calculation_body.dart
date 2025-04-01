/// generalNutritionalInfoId : "d4f8cf85-a648-41fe-96a9-102930a73134"
/// foodPrice : "100000"

class UpdateGeneralCalculationBody {
  UpdateGeneralCalculationBody({
    this.foodPrice,
  });

  UpdateGeneralCalculationBody.fromJson(dynamic json) {
    foodPrice = json['foodPrice'];
  }

  String? foodPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodPrice'] = foodPrice;
    return map;
  }
}
