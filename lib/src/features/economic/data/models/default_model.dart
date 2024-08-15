/// message : "Muvaffaqiyatli saqlandi"
/// data : null
/// errors : null

class DefaultModel {
  DefaultModel({
    this.message,
    this.data,
    this.errors,
  });

  DefaultModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
    errors = json['errors'];
  }

  String? message;
  dynamic data;
  dynamic errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    map['errors'] = errors;
    return map;
  }
}
