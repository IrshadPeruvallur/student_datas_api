import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_datas/view/admin/students/student_data.dart';
import 'package:student_datas/view/admin/students/students_list.dart';
import 'package:student_datas/view/student/display/add_details.dart';
import 'package:student_datas/view/student/display/list_page.dart';

class BottomBarProvider extends ChangeNotifier {
  List<BottomNavigationBarItem> stdItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  List stdTabs = [ListPage(), AddDetails(), AddDetails()];

  int stdCurrendIndex = 0;
  stdBottmIndex(index) {
    stdCurrendIndex = index;
    notifyListeners();
  }

  List<BottomNavigationBarItem> adminItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  List adminTabs = [StudentListPage(), StudentDataPage(), StudentDataPage()];

  int adminCurrendIndex = 0;
  adminBottmIndex(index) {
    stdCurrendIndex = index;
    notifyListeners();
  }
}
