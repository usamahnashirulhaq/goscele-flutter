import 'package:goscele/models/responses/discussion_response.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';

/// Service class to handle the data access and storage of the forum.
class DiscussionRepository {
  static final _discussionBox = locator<HiveService>().boxDiscussion;

  List<Post> get posts => _discussionBox.values;

  set posts(List<Post> posts) {
    posts.forEach((post) => _discussionBox.put(post.id, post));
  }
}
