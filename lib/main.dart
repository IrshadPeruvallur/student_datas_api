import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/student_provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/view/student/login/login.dart';
import 'package:student_datas/view/student/login/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: StudentSignUp(),
      ),
    );
  }
}
