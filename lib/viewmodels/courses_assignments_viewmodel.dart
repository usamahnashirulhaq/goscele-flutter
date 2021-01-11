import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_calendar.dart';
import 'package:goscele/models/course_assignments.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CourseAssignmentsViewModel extends BaseViewModel with FailureListener {
  static final _courseAssignmentsService = locator<CourseAssignmentsService>();
  static final _courseAssignmentsBox = locator<HiveService>().boxCourseAssignments;
  static Map<DateTime, List> _events = new Map<DateTime, List>();

  ValueNotifier<List<CourseAssignments>> courseAssignments = ValueNotifier([]);

  void onModelReady() {
    _courseAssignmentsService.getCourseAssignmentsData();

    /// Listen to local storage changes and update live data (course_assignments)
    _courseAssignmentsBox.listenable().addListener(() {
      courseAssignments.value = _courseAssignmentsBox.values.toList();
    });
  }

  Widget createCalendar() {
    return useValueListenable(courseAssignments) == null ? GoSceleCalendar() : GoSceleCalendar(events: _events);
  }

  /// create list of assignments with all the deadline
  Map<DateTime, List> createEventsMap() {
    CourseAssignments ca = useValueListenable(courseAssignments)[0];

    /// 2D loop to access all data
    ca.courses.forEach((course) {
      course.assignments.forEach((assignment) {
        var date = _millisToDateTime(assignment.duedate);
        var year = date.year;
        var month = "${date.month < 10? "0${date.month}" : "${date.month}"}";
        var day = "${date.day < 10? "0${date.day}" : "${date.day}"}";
        var hour = "${date.hour < 10? "0${date.hour}" : "${date.hour}"}";
        var minute = "${date.minute < 10? "0${date.minute}" : "${date.minute}"}";

        var k = DateTime.parse("$year-$month-$day");
        var v = "${course.fullname}\n${assignment.name}\n\nDeadline: $hour:$minute Scele time";

        if (_events.containsKey(k)) {
          if(!_events[k].contains(v)) {
            List newValue = _events[k];
            newValue.add(v);
            _events.update(k, (value) => newValue);
          }
        } else {
          _events.putIfAbsent(k,
              () => [v]);
        }
      });
    });
    return _events;
  }

  DateTime _millisToDateTime(int millis) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(millis * 1000);
    return date;
  }
}
