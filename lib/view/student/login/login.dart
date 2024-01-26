import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/model/user_model.dart';
import 'package:student_datas/view/admin/login/login.dart';
import 'package:student_datas/view/student/bottom_bar/bottombar.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/display/todo_list_page.dart';
import 'package:student_datas/view/student/login/sign_up.dart';
import 'package:student_datas/view/widgets/buttons.dart';
import 'package:student_datas/view/widgets/messages.dart';
import 'package:student_datas/view/widgets/text_fields.dart';

class StudentLogin extends StatelessWidget {
  StudentLogin({super.key});
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    getProvider.getAllUser();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            textFormField(getProvider.usernameController, 'Username'),
            const SizedBox(
              height: 20,
            ),
            textFormField(getProvider.passwordController, 'Password'),
            const SizedBox(
              height: 20,
            ),
            elevatedButton(
              'Login',
              onPressed: () async {
                await getProvider.userLogin();
                getProvider.matchedUsers!.isNotEmpty
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomBarPage(),
                        ),
                      )
                    : shwoErrorSnackbar(
                        context, 'Username password did not match');
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentSignUp(),
                      ));
                },
                child: Text("SignUp")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLogin(),
                      ));
                },
                child: Text("Admin"))
          ],
        ),
      ),
    );
  }
}
