import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewSection extends StatefulWidget {
  @override
  _CalendarViewSectionState createState() => _CalendarViewSectionState();
}

class _CalendarViewSectionState extends State<CalendarViewSection> {
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _controller,
      availableGestures: AvailableGestures.horizontalSwipe,
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle(color: Colors.blue),
        weekendStyle: TextStyle(color: Colors.red),
        outsideDaysVisible: false,
      ),
    );
  }
}
