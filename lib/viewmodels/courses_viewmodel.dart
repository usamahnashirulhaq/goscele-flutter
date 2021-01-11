import 'package:flutter/cupertino.dart';
import 'package:goscele/models/user_course.dart';
import 'package:goscele/repositories/course_category_repository.dart';
import 'package:goscele/repositories/user_courses_repository.dart';
import 'package:goscele/repositories/user_data_repository.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CoursesViewModel extends FutureViewModel with FailureListener {
  static final _userCoursesService = locator<UserCoursesService>();
  static final _userCoursesRepository = locator<UserCoursesRepository>();
  static final _userDataRepository = locator<UserDataRepository>();
  static final _userCoursesBox = locator<HiveService>().boxUserCourses;
  static final _userCourseCategoryRepository = locator<CourseCategoryRepository>();
  static final _userCourseCategoryService = locator<CourseCategoryService>();

  List<UserCourse> currentCourses = [];
  List<int> currentCategories = [];

  ValueNotifier<List<UserCourse>> courses = ValueNotifier([]);

  @override
  Future<void> futureToRun() => onModelReady();

  /// Menyiapkan komponen-komponen yang perlu di fetch dari webservice, dijalankan secara
  /// async dan await
  Future<void> onModelReady() async {
    int userId = _userDataRepository.userID;
    await _userCourseCategoryService.getCourseCategoryData();
    await _userCoursesService.getUserCoursesData(userId);
  }

  /// Menyiapkan data-data yang akan digunakan pada UI level setelah fetch data dari
  /// webservice selesai dilakukan
  void onModelListener(){
    courses.value =  _userCoursesRepository.courses;

    /// Listen to local storage changes and update live data (user_course)
    _userCoursesBox.listenable().addListener(() {
      courses.value = _userCoursesRepository.courses;
    });

    _currentCategories();
    _getCurrentCourses();
  }

  /// Mempersiapkan kategori dari course yang sedang diambil di semester ini.
  /// Hasil dari kategori-kategori ini digunakan untuk memfilter courses
  /// agar mendapat current courses
  void _currentCategories(){
    var currentYear = DateTime.now().year;
    var currentMonth = DateTime.now().month;
    _userCourseCategoryRepository.categories.forEach((category) {
      if (2 <= currentMonth && currentMonth <= 6){
        var term = "Genap ${currentYear-1}/${currentYear}";
        if (category.name.contains(term)){
          currentCategories.add(category.id);
        }
      }
      else if (8 < currentMonth && currentMonth <= 12){
        var term = "Gasal ${currentYear}/${currentYear+1}";
        if (category.name.contains(term)){
          currentCategories.add(category.id);
        }
      }
      else if (currentMonth == 1){
        var term = "Gasal ${currentYear-1}/${currentYear}";
        if (category.name.contains(term)){
          currentCategories.add(category.id);
        }
      }
    });
  }

  /// Melakukan filter pada courses berdasarkan kategorinya (term/semester)
  void _getCurrentCourses(){
    currentCourses = _userCoursesRepository.courses.where((course) => currentCategories.contains(course.category)).toList();
  }

}
