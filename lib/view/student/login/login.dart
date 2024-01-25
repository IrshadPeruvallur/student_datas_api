import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/model/user_model.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/display/details.dart';
import 'package:student_datas/view/widgets/buttons.dart';

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
            TextFormField(
              controller: getProvider.usernameController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: getProvider.passwordController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            elevatedButton(
              'Login',
              onPressed: () async {
                final List<UserModel> matchedUsers = getProvider.allUserList
                    .where(
                      (UserModel user) =>
                          user.username!
                              .contains(getProvider.usernameController.text) &&
                          user.password!
                              .contains(getProvider.passwordController.text),
                    )
                    .toList();

                if (matchedUsers.isNotEmpty) {
                  final UserModel matchedUser = matchedUsers.first;
                  log("User ID: ${matchedUser.userId}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(),
                    ),
                  );
                } else {
                  log("User not found");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
