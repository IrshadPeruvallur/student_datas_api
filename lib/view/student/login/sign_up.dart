import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/login/login.dart';
import 'package:student_datas/view/widgets/buttons.dart';

class StudentSignUp extends StatelessWidget {
  StudentSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
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
              'SignUp',
              onPressed: () {
                getProvider.creatUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentLogin(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
