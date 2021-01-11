import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_tab.dart';
import 'package:goscele/components/goscele_custom_tab_controller.dart';
import 'package:goscele/pages/subpages/CalendarViewSection.dart';
import 'package:goscele/pages/subpages/ClassScheduleViewSection.dart';
import 'package:goscele/viewmodels/courses_assignments_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseAssignmentsViewModel>.nonReactive(
        viewModelBuilder: () => CourseAssignmentsViewModel(),
        onModelReady: (model) => model.onModelReady(),
        builder: (context, model, child) {
          return Container(
            child: CustomTabController(
              backgroundColor: Color.fromRGBO(0, 172, 223, 1),
              appBarTitle: "Schedule",
              tabs: [
                CustomTab(
                  title: "Calendar",
                  icon: Icons.date_range,
                ),
                CustomTab(
                  title: "Class Schedule",
                  icon: Icons.access_time,
                )
              ],
              children: [
                CalendarViewSection(),
                ClassScheduleViewSection(),
              ],
            ),
          );
        });
  }
}
