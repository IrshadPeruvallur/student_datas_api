import 'package:flutter/material.dart';
import 'package:student_datas/model/user_model.dart';
import 'package:student_datas/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserService userService = UserService();
  List<UserModel> allUserList = [];
  getAllUser() async {
    allUserList = await userService.getUser();
    notifyListeners();
  }

  creatUser() async {
    final data = UserModel(
      username: usernameController.text,
      password: passwordController.text,
    );
    await userService.createUser(data);
    notifyListeners();
  }
}
