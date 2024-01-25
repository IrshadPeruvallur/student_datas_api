class UserModel {
  String? username;
  String? password;
  String? userId;
  UserModel({this.password, this.userId, this.username});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        password: json['password'],
        userId: json['id'],
        username: json['username']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['id'] = userId;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
