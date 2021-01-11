import 'package:goscele/models/responses/forum_response.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';

/// Service class to handle the data access and storage of the forum.
class ForumRepository {
  static final _forumBox = locator<HiveService>().boxForum;

  List<Discussion> get discussions => _forumBox.values;

  set discussions(List<Discussion> discussions) {
    discussions
        .forEach((discussion) => _forumBox.put(discussion.id, discussion));
  }
}
