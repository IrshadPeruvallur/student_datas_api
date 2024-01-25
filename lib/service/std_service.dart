import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_datas/model/student_model.dart';

class StudentService {
  Dio dio = Dio();

  Future<List<StudentModel>> getStudentInfo(userId) async {
    final url =
        'https://65b0ee27d16d31d11bdd9a28.mockapi.io/studentData/user/2/data';
    try {
      final Response response = await dio.get(url);
      if (response.statusCode == 200) {
        log(response.data);
        // final List<dynamic> data = response.data;
        // return data.map((json) => StudentModel.fromJson(json)).toList();
        log(response.data.toString());
        final List<dynamic> data = response.data;
        return data.map((json) => StudentModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log("Error form std service");
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
