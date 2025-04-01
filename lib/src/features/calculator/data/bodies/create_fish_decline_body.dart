/// pondId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// fishTypeId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// fishAmount : 0
/// weight : 0
/// declineType : "string"
/// description : "string"
/// price : 0
/// date : "string"

class CreateFishDeclineBody {
  CreateFishDeclineBody({
    this.pondId,
    this.fishTypeId,
    this.fishAmount,
    this.weight,
    this.declineType,
    this.description,
    this.price,
    this.date,
  });

  CreateFishDeclineBody.fromJson(dynamic json) {
    pondId = json['pondId'];
    fishTypeId = json['fishTypeId'];
    fishAmount = json['fishAmount'];
    weight = json['weight'];
    declineType = json['declineType'];
    description = json['description'];
    price = json['price'];
    date = json['date'];
  }

  String? pondId;
  String? fishTypeId;
  int? fishAmount;
  int? weight;
  String? declineType;
  String? description;
  int? price;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pondId'] = pondId;
    map['fishTypeId'] = fishTypeId;
    map['fishAmount'] = fishAmount;
    map['weight'] = weight;
    map['declineType'] = declineType;
    map['description'] = description;
    map['price'] = price;
    map['date'] = date;
    return map;
  }
}
