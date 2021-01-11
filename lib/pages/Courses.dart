import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_courses_data_search.dart';
import 'package:goscele/components/goscele_custom_tab.dart';
import 'package:goscele/components/goscele_custom_tab_controller.dart';
import 'package:goscele/pages/subpages/AllCourseViewSection.dart';
import 'package:goscele/pages/subpages/CurrentCourseViewSection.dart';
import 'package:goscele/viewmodels/courses_viewmodel.dart';
import 'package:stacked/stacked.dart';


class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoursesViewModel>.nonReactive(
        viewModelBuilder: () => CoursesViewModel(),
        onModelReady: (model) => model.onModelListener(),
        builder: (context, model, child) {
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
              CurrentCoursesViewSection(),
              AllCoursesViewSection(),
            ],
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: CoursesDataSearch());
                  })
            ],
          );
        });
  }
}
