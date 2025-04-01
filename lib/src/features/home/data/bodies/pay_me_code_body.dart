/// id : "<integer>"
/// token : "<string>"
/// code : "<string>"
/// amount : "<integer>"

class PayMeCodeBody {
  PayMeCodeBody({
    this.id,
    this.token,
    this.code,
    this.paymentDefinitionId,
  });

  PayMeCodeBody.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
    code = json['code'];
    paymentDefinitionId = json['paymentDefinitionId'];
  }

  int? id;
  String? token;
  String? code;
  String? paymentDefinitionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['code'] = code;
    map['paymentDefinitionId'] = paymentDefinitionId;
    return map;
  }
}
