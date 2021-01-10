import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_forum.dart';
import 'package:goscele/viewmodels/forum_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class GeneralDiscussionViewSection extends HookViewModelWidget<ForumViewModel> {
  final parent = 0;

  @override
  Widget buildViewModelWidget(BuildContext context, ForumViewModel viewModel) {
    var discussions = useValueListenable(viewModel.discussions);

    // manually sort discussions by date
    discussions.sort((a, b) => a.created.compareTo(b.created));
    discussions = List.from(discussions.reversed);

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
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Tap'),
            ));
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
