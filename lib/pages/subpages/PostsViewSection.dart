import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_discussion.dart';
import 'package:goscele/pages/DiscussionFocus.dart';
import 'package:goscele/viewmodels/discussion_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class PostsViewSection extends HookViewModelWidget<DiscussionViewModel> {
  final int discussionId;
  final parentPostId;
  final String discussionTitle;

  PostsViewSection(this.discussionId, this.parentPostId, this.discussionTitle);

  @override
  Widget buildViewModelWidget(
      BuildContext context, DiscussionViewModel viewModel) {
    var posts = useValueListenable(viewModel.posts);

    // manually sort posts by replies
    var postsModified = [];

    for (var i = 0; i < posts.length; i++) {
      if (posts[i].id == parentPostId) {
        postsModified.add(posts[i]);
        if (posts[i].children.length > 0) {
          for (var j = 0; j < posts.length; j++) {
            if (posts[j].parent == posts[i].id) {
              postsModified.add(posts[j]);
            }
          }
        }
      }
    }

    return ListView.builder(
      itemCount: postsModified.length,
      itemBuilder: (context, index) {
        final post = postsModified[index];
        VoidCallback nextReplyCallback;
        if (post.id == this.parentPostId || post.parent == 0 || post.children.length == 0) {
          nextReplyCallback = () {};
        } else {
          nextReplyCallback = () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DiscussionFocus(
                      this.discussionId, post.id, this.discussionTitle);
                },
              ),
            );
          };
        }

        return CustomCard(
          title: post.subject,
          callback: nextReplyCallback,
          leftMargin:
              post.id == this.parentPostId || post.parent == 0 ? null : 20,
          fills: [
            CustomCardDiscussion(
                post.userfullname,
                DateTime.fromMillisecondsSinceEpoch(post.created * 1000),
                post.message,
                post.id == this.parentPostId || post.parent == 0,
                post.children.length == 0),
          ],
        );
      },
    );
  }
}
