import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:student_datas/model/user_model.dart';
import 'package:student_datas/service/shrd_prfrns.dart';
import 'package:student_datas/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserService userService = UserService();
  List<UserModel> allUserList = [];
  List<UserModel>? matchedUsers;
  ShrdPrf shrdPrf = ShrdPrf();

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
    clearController();
    notifyListeners();
  }

  userLogin() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      matchedUsers = allUserList
          .where(
            (UserModel user) =>
                user.username!.contains(usernameController.text) &&
                user.password!.contains(passwordController.text),
          )
          .toList();

      if (matchedUsers!.isNotEmpty) {
        final UserModel matchedUser = matchedUsers!.first;
        final String userId = matchedUser.userId.toString();
        log("User ID: $userId");
        shrdPrf.setShrdPrf('userId', userId);

        notifyListeners();
      } else {
        log("User not found");
      }
    }
  }

  clearController() {
    usernameController.clear();
    passwordController.clear();
  }
}
