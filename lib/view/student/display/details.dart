import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/student_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context, listen: false).getStudentDatas();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<StudentProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.studentDataList.length,
                  itemBuilder: (context, index) {
                    final data = value.studentDataList[index];
                    return ListTile(
                      title: Text(data.name.toString()),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
