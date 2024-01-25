class StudentModel {
  String? id;
  String? name;
  String? address;
  int? phone;
  String? email;
  StudentModel({this.name, this.address, this.email, this.phone, this.id});
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        email: json['email'],
        phone: json['phone']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
