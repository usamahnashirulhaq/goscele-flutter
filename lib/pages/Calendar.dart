import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_tab.dart';
import 'package:goscele/components/goscele_custom_tab_controller.dart';
import 'package:goscele/pages/subpages/CalendarViewSection.dart';
import 'package:goscele/pages/subpages/ClassScheduleViewSection.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTabController(
        backgroundColor: Color.fromRGBO(0, 172, 223, 1),
        appBarTitle: "Calendar",
        tabs: [
          CustomTab(
            title: "Deadline",
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
