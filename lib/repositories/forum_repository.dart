import 'package:goscele/models/responses/forum_response.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';

/// Service class to handle the data access and storage of the forum.
class ForumRepository {
  static final _forumBox = locator<HiveService>().boxForum;
  static final _otherForumBox = locator<HiveService>().boxOtherForum;

  List<Discussion> get discussions => _forumBox.values;

  List<Discussion> get otherDiscussions => _otherForumBox.values;

  clearForumBox() {
    _forumBox.clear();
  }

  clearOtherForumBox() {
    _otherForumBox.clear();
  }

  set discussions(List<Discussion> discussions) {
    discussions
        .forEach((discussion) => _forumBox.put(discussion.id, discussion));
  }

  set otherDiscussions(List<Discussion> discussions) {
    discussions
        .forEach((discussion) => _otherForumBox.put(discussion.id, discussion));
  }
}
