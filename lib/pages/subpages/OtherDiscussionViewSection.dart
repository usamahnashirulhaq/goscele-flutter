import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_forum.dart';
import 'package:goscele/pages/DiscussionFocus.dart';
import 'package:goscele/viewmodels/other_forum_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class OtherDiscussionViewSection
    extends HookViewModelWidget<OtherForumViewModel> {
  final parent = 0;

  @override
  Widget buildViewModelWidget(
      BuildContext context, OtherForumViewModel viewModel) {
    var discussions = useValueListenable(viewModel.discussions);

    // manually sort discussions by date
    discussions.sort((a, b) => a.created.compareTo(b.created));
    discussions = List.from(discussions.reversed);

    /// issue! loading screen, how to use futureviewmodel here?
    if (discussions.length < 1) {
      return CustomCard(title: "Forum is empty / Has no discussions");
    }

    return ListView.builder(
      itemCount: discussions.length,
      itemBuilder: (context, index) {
        final discussion = discussions[index];
        if (discussion.parent != parent) {
          return SizedBox.shrink();
        }
        return CustomCard(
          title: discussion.name,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DiscussionFocus(
                    discussion.discussion, discussion.id, discussion.name);
              }),
            );
          },
          fills: [
            CustomCardForum(
              discussion.userfullname,
              DateTime.fromMillisecondsSinceEpoch(discussion.created * 1000),
              discussion.message,
            ),
          ],
        );
      },
    );
  }
}
