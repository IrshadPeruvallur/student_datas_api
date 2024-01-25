import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/student_provider.dart';
import 'package:student_datas/view/student/display/details.dart';
import 'package:student_datas/view/widgets/buttons.dart';
import 'package:student_datas/view/widgets/text_fields.dart';

class AddDetails extends StatelessWidget {
  AddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<StudentProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            textFormField(getProvider.nameController, 'Name'),
            SizedBox(
              height: 20,
            ),
            textFormField(getProvider.ageController, 'Age'),
            SizedBox(
              height: 20,
            ),
            textFormField(getProvider.phoneController, 'phone'),
            SizedBox(
              height: 20,
            ),
            textFormField(getProvider.emailController, 'Email'),
            SizedBox(
              height: 20,
            ),
            elevatedButton(
              'Submit',
              onPressed: () {
                // getProvider.postStudentDatas();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
