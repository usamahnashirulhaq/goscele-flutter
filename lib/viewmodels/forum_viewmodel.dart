import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:goscele/models/responses/forum_response.dart';
import 'package:goscele/repositories/forum_repository.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/forum_service.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

class ForumViewModel extends BaseViewModel with FailureListener {
  static final _forumService = locator<ForumService>();
  static final _forumRepository = locator<ForumRepository>();
  static final _forumBox = locator<HiveService>().boxForum;

  ValueNotifier<List<Discussion>> discussions = ValueNotifier([]);

  void onModelReady() {
    _forumService.getGeneralForumData();
    /// Listen to local storage changes and update live data (user_course)
    _forumBox.listenable().addListener(() {
      discussions.value = _forumBox.values.toList();
    });
  }
}
