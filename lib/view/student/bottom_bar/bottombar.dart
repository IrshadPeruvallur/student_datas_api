import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_datas/controller/pages_controller/bottom_bar.dart';

class BottomBarPage extends StatelessWidget {
  BottomBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getPrvdr = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: getPrvdr.stdTabs[getPrvdr.stdCurrendIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: getPrvdr.stdItems,
        currentIndex: getPrvdr.stdCurrendIndex,
        onTap: (value) => getPrvdr.stdBottmIndex(value),
      ),
    );
  }
}
