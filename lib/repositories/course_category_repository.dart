import 'package:goscele/models/course_category.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';

/// Service class to handle the data access and storage of the course category
class CourseCategoryRepository {
  static final _courseCategoryBox = locator<HiveService>().boxCourseCategory;

  List<CourseCategory> get categories => _courseCategoryBox.values.toList();

  set categories(List<CourseCategory> categories) {
    categories.forEach((category) => _courseCategoryBox.put(category.id, category));
  }
}
