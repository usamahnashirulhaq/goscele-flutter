import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_class_schedule_entry.dart';

class CurrentCoursesViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO ganti jadi Widget yang nampilin Current Courses
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CustomCard(
              title: "Monday",
              fills: [],
            ),
            CustomCard(
              title: "Tuesday",
              fills: [
                CustomCardClassScheduleEntry(
                  "TKBM TPL",
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
