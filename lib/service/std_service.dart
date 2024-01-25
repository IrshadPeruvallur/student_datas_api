import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_datas/model/student_model.dart';

class StudentService {
  Dio dio = Dio();

  Future<List<StudentModel>> getStudentInfo(userId) async {
    final url = 'https://65b0ee27d16d31d11bdd9a28.mockapi.io/studentData/user/$userId/data';
    try {
      final Response response = await dio.get(url);
      log("${response.statusCode}");
      log(url);
      if (response.statusCode == 200) {
        log("successfull");
        final data = response.data as List;
        return data.map((data) => StudentModel.fromJson(data)).toList();
      } else {
        throw Exception('Faild to load data');
      }
    } catch (e) {
      log('error form stdGetInfo');
      rethrow;
    }
  }
  addStudentInfo(StudentModel data, userId) async {
    final url =
        'https://65b0ee27d16d31d11bdd9a28.mockapi.io/studentData/user/$userId/data';
    try {
      await dio.post(url, data: data.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
