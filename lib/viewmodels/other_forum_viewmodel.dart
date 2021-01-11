import 'package:flutter/cupertino.dart';
import 'package:goscele/models/responses/forum_response.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/forum_service.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

class OtherForumViewModel extends BaseViewModel with FailureListener {
  static final _forumService = locator<ForumService>();
  static final _otherForumBox = locator<HiveService>().boxOtherForum;

  ValueNotifier<List<Discussion>> discussions = ValueNotifier([]);

  void onModelReady(int forumId) {
    _forumService.getForumDataById(forumId);

    _otherForumBox.listenable().addListener(() {
      discussions.value = _otherForumBox.values.toList();
    });
  }
}
