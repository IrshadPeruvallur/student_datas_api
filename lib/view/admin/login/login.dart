import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/model/user_model.dart';
import 'package:student_datas/view/admin/bottom_bar/bottom_bar.dart';
import 'package:student_datas/view/admin/students/students_list.dart';
import 'package:student_datas/view/student/bottom_bar/bottombar.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/display/list_page.dart';
import 'package:student_datas/view/student/login/sign_up.dart';
import 'package:student_datas/view/widgets/buttons.dart';
import 'package:student_datas/view/widgets/messages.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            elevatedButton(
              'Login',
              onPressed: () async {
                usernameController.text == "irshad" &&
                        passwordController.text == "000"
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminBottomBarPage(),
                        ),
                      )
                    : shwoErrorSnackbar(
                        context, 'Username password did not match');
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
