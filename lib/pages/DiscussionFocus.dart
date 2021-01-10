import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/models/responses/forum_response.dart';
import 'package:goscele/pages/subpages/PostsViewSection.dart';
import 'package:goscele/viewmodels/discussion_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DiscussionFocus extends StatelessWidget {
  final int discussionId;
  final parent;
  final String discussionTitle;

  DiscussionFocus(this.discussionId, this.parent, this.discussionTitle);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiscussionViewModel>.nonReactive(
      viewModelBuilder: () => DiscussionViewModel(),
      onModelReady: (model) => model.onModelReady(this.discussionId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 172, 223, 1),
            title: Text(this.discussionTitle),
          ),
          body: PostsViewSection(this.discussionId, this.parent, this.discussionTitle),
        );
      },
    );
  }
}
