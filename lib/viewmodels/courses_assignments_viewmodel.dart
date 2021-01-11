import 'package:goscele/models/course_assignments.dart';
import 'package:goscele/repositories/course_assignments_repository.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';

class CourseAssignmentsViewModel extends FutureViewModel with FailureListener {
  static final _courseAssignmentsService = locator<CourseAssignmentsService>();
  static final _courseAssignmentRepository = locator<CourseAssignmentsRepository>();
  Map<DateTime, List> events = new Map<DateTime, List>();
  CourseAssignments courseAssignments;

  @override
  Future<void> futureToRun() => onModelReady();

  Future<void> onModelReady() async {
    await _courseAssignmentsService.getCourseAssignmentsData();
  }

  void onModelListener() {
    courseAssignments = _courseAssignmentRepository.courseAssignments;
    _createEventsMap();
  }

  /// create list of assignments with all the deadline
  Map<DateTime, List> _createEventsMap() {
    CourseAssignments ca = _courseAssignmentRepository.courseAssignments;

    /// 2D loop to access all data
    ca.courses.forEach((course) {
      course.assignments.forEach((assignment) {
        var date = _millisToDateTime(assignment.duedate);
        var year = date.year;
        var month = "${date.month < 10 ? "0${date.month}" : "${date.month}"}";
        var day = "${date.day < 10 ? "0${date.day}" : "${date.day}"}";
        var hour = "${date.hour < 10 ? "0${date.hour}" : "${date.hour}"}";
        var minute =
            "${date.minute < 10 ? "0${date.minute}" : "${date.minute}"}";

        var k = DateTime.parse("$year-$month-$day");
        var v =
            "${course.fullname}\n${assignment.name}\n\nDeadline: $hour:$minute Scele time";

        if (events.containsKey(k)) {
          if (!events[k].contains(v)) {
            List newValue = events[k];
            newValue.add(v);
            events.update(k, (value) => newValue);
          }
        } else {
          events.putIfAbsent(k, () => [v]);
        }
      });
    });
    return events;
  }

  DateTime _millisToDateTime(int millis) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(millis * 1000);
    return date;
  }
}
