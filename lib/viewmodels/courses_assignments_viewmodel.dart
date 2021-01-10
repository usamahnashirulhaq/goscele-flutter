import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/models/course_assignments.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CourseAssignmentsViewModel extends BaseViewModel with FailureListener {
  static final _courseAssignmentsService = locator<CourseAssignmentsService>();
  static final _courseAssignmentsBox = locator<HiveService>()
      .boxCourseAssignments;
  static Map<DateTime, List> _events = new Map<DateTime, List>();

  ValueNotifier<List<CourseAssignments>> courseAssignments = ValueNotifier([]);

  void onModelReady() {
    _courseAssignmentsService.getCourseAssignmentsData();

    /// Listen to local storage changes and update live data (course_assignments)
    _courseAssignmentsBox.listenable().addListener(() {
      courseAssignments.value = _courseAssignmentsBox.values.toList();
    });
  }

  /// create list of assignments with all the deadline
  void createEventsMap() {
    CourseAssignments ca = useValueListenable(courseAssignments)[0];

    /// 2D loop to access all data
    ca.courses.forEach((course) {
      course.assignments.forEach((assignment) {
      _events.putIfAbsent(_millisToDateTime(assignment.duedate), () => [course.fullname, assignment.name]);
      });
    });

    print(_events);
  }

  DateTime _millisToDateTime(int millis){
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(millis*1000);
    return date;
  }
}

