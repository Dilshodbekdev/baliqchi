/// id : 418
/// token : "66f52c08cd8e7699091f75ae_CRiMMX1AeYBs3ffspxrHM1WDWmhEMsFH99zAKr2pe4fDMQ6JjvyfU6Bp49KYMvVMO7EUjMvfgZZADooG1YEm4uuZBbPDDwHT1EgpWmuqXWxzxp570dbu1HaFsHasIU29Nhzs2FT380AWd2IFMmOVewNsR5mDjeQhFq35E8qA5I1rZrcEAjfMzQaqX2fPuwJ1hDRDpJtMcrBJZBjVtDzG5u6w0oyiSSViUrt8MGsPzj0bIUwzefSKcQQaCvEwUhRdOYINwmI6DYfEFuiF4Es9Yh27AIday2vBN9c92AXVj5PCG0Zv8U3vus0Wy9jy4ds6Kdaa1xk09icGVX2RvRShFhUBSMMpHpby7GuvuSwsDFjPSKWwqYo7FzDuQIJCNZC8rx4Gpx"
/// phone : "99899*****13"
/// time : 60000

class PayMeCardModel {
  PayMeCardModel({
    this.id,
    this.token,
    this.phone,
    this.time,
  });

  PayMeCardModel.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
    phone = json['phone'];
    time = json['time'];
  }

  int? id;
  String? token;
  String? phone;
  int? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['phone'] = phone;
    map['time'] = time;
    return map;
  }
}
