import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goscele/components/goscele_custom_card.dart';
import 'package:goscele/components/goscele_custom_card_forum.dart';
import 'package:goscele/viewmodels/forum_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class GeneralDiscussionViewSection extends HookViewModelWidget<ForumViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, ForumViewModel viewModel) {
    final discussions = useValueListenable(viewModel.discussions);
    log(discussions.toString());
    return ListView.builder(
        itemCount: discussions.length,
        itemBuilder: (context, index) {
          final discussion = discussions[index];
          return CustomCard(title: discussion.name, fills: [
            CustomCardForum(
              discussion.userfullname,
              DateTime.fromMillisecondsSinceEpoch(discussion.created * 1000),
              discussion.message,
              discussion.parent == 0,
              discussion.numreplies == "0",
            ),
          ]);
        });
  }
}
