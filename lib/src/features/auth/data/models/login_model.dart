/// id : "f8c0ac1b-16cc-4f3c-8356-deabd66a0d2d"
/// role : "CLIENT"
/// username : "998941867710"
/// firstName : "Dilshodek"
/// lastName : "Nurullayev"

class LoginModel {
  LoginModel({
      this.id, 
      this.role, 
      this.username, 
      this.firstName, 
      this.lastName,});

  LoginModel.fromJson(dynamic json) {
    id = json['id'];
    role = json['role'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }
  String? id;
  String? role;
  String? username;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['role'] = role;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    return map;
  }

}