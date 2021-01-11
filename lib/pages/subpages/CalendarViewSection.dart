import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_calendar.dart';
import 'package:goscele/viewmodels/courses_assignments_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CalendarViewSection
    extends HookViewModelWidget<CourseAssignmentsViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, CourseAssignmentsViewModel viewModel) {

    return GoSceleCalendar(events: viewModel.events);
  }
}
