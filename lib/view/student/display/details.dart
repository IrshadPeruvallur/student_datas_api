import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/student_provider.dart';
import 'package:student_datas/model/shrd_prf_provider.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/login/login.dart';
import 'package:student_datas/view/widgets/buttons.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context, listen: false).getStudentDatas();
    final shrdPvdr = Provider.of<ShrdPrfProvider>(context, listen: false);
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
      body: Consumer<StudentProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.studentDataList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(value.studentDataList[index].name.toString()),
                    );
                  },
                ),
              ),
              elevatedButton(
                'Add Details',
                onPressed: () async {
                  final String id = await shrdPvdr.getShrdPrf('userId');
                  log("$id");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDetails(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
