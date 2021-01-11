import 'package:flutter/cupertino.dart';
import 'package:goscele/models/responses/discussion_response.dart';
import 'package:goscele/repositories/discussion_repository.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

class DiscussionViewModel extends BaseViewModel with FailureListener {
  static final _discussionService = locator<DiscussionService>();
  static final _discussionRepository = locator<DiscussionRepository>();
  static final _discussionBox = locator<HiveService>().boxDiscussion;

  ValueNotifier<List<Post>> posts = ValueNotifier([]);

  void onModelReady(int discussionId) {
    _discussionService.getDiscussionDataByDiscussionId(discussionId);

    _discussionBox.listenable().addListener(() {
      posts.value = _discussionBox.values.toList();
    });
  }
}
