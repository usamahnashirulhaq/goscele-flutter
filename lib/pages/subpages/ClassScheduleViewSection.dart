import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_class_schedule_entry.dart';
import 'package:goscele/viewmodels/courses_assignments_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ClassScheduleViewSection
    extends HookViewModelWidget<CourseAssignmentsViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context,
      CourseAssignmentsViewModel viewModel) {

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CustomCard(
              title: "Monday",
              fills: [ CustomCardClassScheduleEntry(
                "EMPTY <not implemented yet>",
                "R. X.ZZZZ",
                "xx.xx - xx.xx",
              ),],
            ),
            CustomCard(
              title: "Tuesday",
              fills: [
                CustomCardClassScheduleEntry(
                  "<PLACEHOLDER>",
                  "R. 2.2302",
                  "09.00 - 15.30",
                ),
              ],
            )
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
        }
  }
