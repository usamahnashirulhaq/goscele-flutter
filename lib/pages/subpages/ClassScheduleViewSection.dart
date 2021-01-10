import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_course.dart';
import 'package:goscele/models/course_assignments.dart';
import 'package:goscele/viewmodels/courses_assignments_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ClassScheduleViewSection
    extends HookViewModelWidget<CourseAssignmentsViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context,
      CourseAssignmentsViewModel viewModel) {
    final courseAssignments = useValueListenable(viewModel.courseAssignments);
    List<Course> courses = courseAssignments.first.courses;
    int courseIndex = 0;
    Course course = courses[courseIndex];
    viewModel.createEventsMap();

    return ListView.builder(
        itemCount: course.assignments.length,
        itemBuilder: (context, index) {
          courseIndex++;
          final assignment = course.assignments[index];
          return CustomCard(
                    title: assignment.name,
                    fills: [
                      CustomCardCourse(
                        course.fullname,
                      ),
                    ]);
              });
        }
  }

// @override
// Widget build(BuildContext context) {
//   return SingleChildScrollView(
//     child: Container(
//       child: Column(
//         children: [
//           CustomCard(
//             title: "Monday",
//             fills: [],
//           ),
//           CustomCard(
//             title: "Tuesday",
//             fills: [
//               CustomCardSchedule(
//                 "TKBM TPL",
//                 "R. 2.2302",
//                 "09.00 - 15.30",
//               ),
//             ],
//           )
//         ],
//       ),
//       padding: EdgeInsets.all(10),
//     ),
//   );
// }
