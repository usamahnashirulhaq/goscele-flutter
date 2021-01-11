import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_course.dart';
import 'package:goscele/viewmodels/courses_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CurrentCoursesViewSection extends ViewModelWidget<CoursesViewModel> {
  @override
  Widget build(BuildContext context, CoursesViewModel viewModel) {
    final currentCourses = viewModel.currentCourses;

    return ListView.builder(
        itemCount: currentCourses.length,
        itemBuilder: (context, index) {
          final course = currentCourses[index];
          return CustomCard(title: course.fullname, fills: [
            CustomCardCourse(
              course.shortname,
            ),
          ]);
        });
  }
}
