import 'package:flutter/material.dart';
import 'package:student_datas/model/student_model.dart';
import 'package:student_datas/service/std_service.dart';

class StudentProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  StudentService studentService = StudentService();
  List<StudentModel> studentDataList = [];
  getStudentDatas() async {
    studentDataList = await studentService.getStudentInfo();
    notifyListeners();
  }

  postStudentDatas() async {
    final data = StudentModel(
        name: nameController.text,
        age: int.parse(ageController.text),
        email: emailController.text,
        phone: int.parse(phoneController.text));

    await studentService.addStudentInfo(data);
    notifyListeners();
  }
}
