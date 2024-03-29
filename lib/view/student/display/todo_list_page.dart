import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/student_provider.dart';
import 'package:student_datas/model/shrd_prf_provider.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/display/todo_page.dart';
import 'package:student_datas/view/student/login/login.dart';
import 'package:student_datas/view/widgets/buttons.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shrdPvdr = Provider.of<ShrdPrfProvider>(context, listen: false);
    final value = Provider.of<StudentProvider>(context, listen: false);
    value.getStudentDatas();
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
          Consumer<StudentProvider>(builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: value.studentDataList.length,
                itemBuilder: (context, index) {
                  final data = value.studentDataList[index];
                  return ListTile(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TodoPage(name: data.name, age: data.address, phone: data.phone),)),
                    title: Text(data.name?.toString() ?? 'No Name'),
                    subtitle: Text(data.phone?.toString() ?? 'No Phone'),
                  );
                },
              ),
            );
          }),
          elevatedButton(
            'Add Details',
            onPressed: () async {
             
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddDetails(),
                ),
              );
            },
          ),
        ],
      ),
     
    );
  }
}
