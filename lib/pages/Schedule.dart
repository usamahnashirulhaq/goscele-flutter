import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_tab.dart';
import 'package:goscele/components/goscele_custom_tab_controller.dart';
import 'package:goscele/pages/subpages/CalendarViewSection.dart';
import 'package:goscele/pages/subpages/ClassScheduleViewSection.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
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
  }
}
