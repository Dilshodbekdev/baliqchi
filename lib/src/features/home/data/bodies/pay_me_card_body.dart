/// number : "<string>"
/// expire : "<string>"

class PayMeCardBody {
  PayMeCardBody({
    this.number,
    this.expire,
  });

  PayMeCardBody.fromJson(dynamic json) {
    number = json['number'];
    expire = json['expire'];
  }

  String? number;
  String? expire;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['expire'] = expire;
    return map;
  }
}
