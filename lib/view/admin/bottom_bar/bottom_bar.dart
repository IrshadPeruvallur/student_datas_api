import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/pages_controller/bottom_bar.dart';

class AdminBottomBarPage extends StatelessWidget {
  AdminBottomBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getPrvdr = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: getPrvdr.adminTabs[getPrvdr.adminCurrendIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: getPrvdr.adminItems,
        currentIndex: getPrvdr.adminCurrendIndex,
        onTap: (value) => getPrvdr.adminBottmIndex(value),
      ),
    );
  }
}
