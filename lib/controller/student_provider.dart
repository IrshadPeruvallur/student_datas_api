import 'package:flutter/material.dart';
import 'package:student_datas/model/student_model.dart';
import 'package:student_datas/service/shrd_prfrns.dart';
import 'package:student_datas/service/std_service.dart';

class StudentProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  StudentService studentService = StudentService();
  List<StudentModel> studentDataList = [];
  ShrdPrf shrdPrf = ShrdPrf();

  getStudentDatas() async {
    final userId = await shrdPrf.getShrdPrf('userId');
    studentDataList = await studentService.getStudentInfo(userId);
    notifyListeners();
  }

  postStudentDatas() async {
    final userId = await shrdPrf.getShrdPrf('userId');
    final data = StudentModel(
        name: nameController.text,
        address: addressController.text,
        email: emailController.text,
        phone: int.parse(phoneController.text));

    await studentService.addStudentInfo(data, userId);
    getStudentDatas();
  }
}
