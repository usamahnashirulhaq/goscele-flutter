import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_forum_academic_data_search.dart';
import 'package:goscele/pages/subpages/GeneralDiscussionViewSection.dart';
import 'package:goscele/viewmodels/forum_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Academic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumViewModel>.nonReactive(
      viewModelBuilder: () => ForumViewModel(),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 172, 223, 1),
            title: Text("Academic Announcements"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: ForumDataSearch());
                },
              ),
            ],
          ),
          body: GeneralDiscussionViewSection(),
        );
      },
    );
  }
}
