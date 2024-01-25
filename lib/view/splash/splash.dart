import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/model/shrd_prf_provider.dart';
import 'package:student_datas/view/student/display/details.dart';
import 'package:student_datas/view/student/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  checkUserLoggedIn() async {
    final isLogedIn = await Provider.of<ShrdPrfProvider>(context, listen: false)
        .getShrdPrf("userId");
    if (isLogedIn != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StudentLogin(),
          ));
    }
  }
}
