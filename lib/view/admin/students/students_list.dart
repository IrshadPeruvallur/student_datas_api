import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/student_provider.dart';
import 'package:student_datas/controller/user_provider.dart';
import 'package:student_datas/model/shrd_prf_provider.dart';
import 'package:student_datas/view/student/login/login.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shrdPvdr = Provider.of<ShrdPrfProvider>(context, listen: false);
    final value = Provider.of<UserProvider>(context, listen: false);
    value.getAllUser();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  shrdPvdr.clearShrdPrf();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentLogin(),
                      ),
                      (route) => false);
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
        body: Column(
          children: [
            Consumer<UserProvider>(builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.allUserList.length,
                  itemBuilder: (context, index) {
                    final data = value.allUserList[index];
                    return ListTile(
                      title: Text(data.username?.toString() ?? 'No Name'),
                      // subtitle: Text(data.phone?.toString() ?? 'No Phone'),
                    );
                  },
                ),
              );
            }),
          ],
        ));
  }
}
