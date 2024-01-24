class StudentModel {
  String? id;
  String? name;
  int? age;
  int? phone;
  String? email;
  StudentModel({this.name, this.age, this.email, this.phone, this.id});
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        email: json['email'],
        phone: json['phone']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
