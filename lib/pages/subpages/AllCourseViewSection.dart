import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_card_class_schedule_entry.dart';
import 'package:goscele/viewmodels/courses_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class AllCoursesViewSection extends HookViewModelWidget<CoursesViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context,
      CoursesViewModel viewModel) {
    final courses = useValueListenable(viewModel.courses);

    return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CustomCardClassScheduleEntry(
            course.fullname,
            course.shortname,
            course.category.toString(),
          );
        });
  }
}
