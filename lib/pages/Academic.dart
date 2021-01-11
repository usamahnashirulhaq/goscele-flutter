import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_forum_academic_data_search.dart';
import 'package:goscele/pages/subpages/DiscussionViewSection.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/utils/constants.dart';
import 'package:goscele/viewmodels/forum_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Academic extends StatelessWidget {
  String title = "Academic Announcements";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumViewModel>.nonReactive(
      key: Key("Announcements"),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      viewModelBuilder: () => locator<ForumViewModel>(),
      onModelReady: (model) => model.onModelReady(Constants.pengumumanAkademisID),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 172, 223, 1),
            title: Text(title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: ForumDataSearch());
                },
              ),
            ],
          ),
          body: DiscussionViewSection(),
        );
      },
    );
  }
}
