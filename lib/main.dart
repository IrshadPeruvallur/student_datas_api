import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/pages_controller/bottom_bar.dart';
import 'package:student_datas/controller/student_provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/model/shrd_prf_provider.dart';
import 'package:student_datas/view/splash/splash.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(
          create: (context) => ShrdPrfProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomBarProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
