import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_datas/model/student_model.dart';
import 'package:student_datas/model/user_model.dart';

class UserService {
  Dio dio = Dio();
  // final url = 'https://659fab885023b02bfe8a247e.mockapi.io/api/todo/school';

  Future<List<UserModel>> getUser() async {
    const url = 'https://65b0ee27d16d31d11bdd9a28.mockapi.io/studentData/user';

    try {
      final Response response = await dio.get(url);
      log("${response.statusCode}");
      log(url);
      if (response.statusCode == 200) {
        log("Loaded all student details");
        final data = response.data as List;
        return data.map((data) => UserModel.fromJson(data)).toList();
      } else {
        throw Exception('Faild to load data');
      }
    } catch (e) {
      log('message');
      rethrow;
    }
  }

  createUser(UserModel data) async {
    const url = 'https://65b0ee27d16d31d11bdd9a28.mockapi.io/studentData/user';
    try {
      await dio.post(url, data: data.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
