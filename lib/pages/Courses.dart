import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_courses_data_search.dart';
import 'package:goscele/components/goscele_custom_tab.dart';
import 'package:goscele/components/goscele_custom_tab_controller.dart';
import 'package:goscele/pages/subpages/AllCourseViewSection.dart';
import 'package:goscele/pages/subpages/CurrentCourseViewSection.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return CustomTabController(
      backgroundColor: Color.fromRGBO(0, 172, 223, 1),
      appBarTitle: "Courses",
      tabs: [
        CustomTab(
          title: "Current Courses",
          icon: Icons.class__outlined,
        ),
        CustomTab(
          title: "All Courses",
          icon: Icons.collections_bookmark_outlined,
        ),
      ],
      children: [
        AllCoursesViewSection(),
        CurrentCoursesViewSection(),
      ],
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CoursesDataSearch());
            })
      ],
    );
  }
}
