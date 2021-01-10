import 'package:flutter/material.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/responses/discussion_response.dart';
import 'package:goscele/repositories/discussion_repository.dart';
import 'package:goscele/services/services.dart';

import '../service_locator.dart';
import 'api_service.dart';

class DiscussionService {
  static final _apiService = locator<ApiService>();
  static final _discussionData = locator<DiscussionRepository>();

  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

  Future<void> getDiscussionDataByDiscussionId(int discussionId) async {
    hasFailure.value = const NoFailure();
    final response = await _apiService.getDiscussionData(discussionId);
    response.fold(
      (l) {
        hasFailure.value = l;
      },
      (r) {
        _setDiscussionData(r);
      },
    );
  }

  void _setDiscussionData(List<Post> response) {
    _discussionData.posts = response;
  }
}
