import 'package:flutter/material.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/responses/forum_response.dart';
import 'package:goscele/repositories/forum_repository.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/constants.dart';

import '../service_locator.dart';
import 'api_service.dart';

class ForumService {
  static final _apiService = locator<ApiService>();
  static final _forumData = locator<ForumRepository>();

  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

  Future<void> getForumDataById(int forumId) async {
    hasFailure.value = const NoFailure();
    final response = await _apiService.getForumData(forumId);
    response.fold(
      (l) {
        hasFailure.value = l;
      },
      (r) {
        _setForumData(r);
      },
    );
  }

  /// Stores the user data retrieved from the backend into the local storage.
  void _setForumData(List<Discussion> response) {
    _forumData.discussions = response;
  }
}
