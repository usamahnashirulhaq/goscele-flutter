import 'package:flutter/material.dart';
import 'package:goscele/pages/subpages/OtherDiscussionViewSection.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/utils/constants.dart';
import 'package:goscele/viewmodels/forum_viewmodel.dart';
import 'package:goscele/viewmodels/other_forum_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ForumDataSearch extends SearchDelegate<String> {
  List<String> _data = [
    "Forum Kurikulum 2016",
    "Forum Umum",
    "Forum KP - ST - TA",
    "Forum Perpustakaan",
    "Forum Beasiswa",
    "Forum Asisten",
    "Forum Feedback",
    "Forum Usul",
    "Forum Santai",
    "Forum Tanya-Jawab",
    "Forum Lowongan",
    "Forum Peraturan Akademis",
    "Forum Lost and Found",
    "Forum UKM",
    "Forum Kompetisi",
    "Forum Informasi Wisudawan",
    "Forum Helpdesk",
    "Forum Penulisan Ilmiah MIK DIK"
  ];

  String _selectedKey;
  int _selectedId;

  @override
  String get searchFieldLabel => "Type 'forum' to see all";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
        /// Bad practices: shouldn't force 'onModelReady' with singleton
        /// viewmodel. Issue!
        locator<ForumViewModel>().onModelReady(Constants.pengumumanAkademisID);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _selectedId = Constants.forumMapId[_selectedKey];

    return ViewModelBuilder<OtherForumViewModel>.nonReactive(
      key: Key("forum-$_selectedId}"),
      viewModelBuilder: () => OtherForumViewModel(),
      onModelReady: (model) => model.onModelReady(_selectedId),
      builder: (context, model, child) {
        return Scaffold(
          body: OtherDiscussionViewSection(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final _suggestionList = query.isEmpty
        ? _data
        : _data
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          _selectedKey = _suggestionList[index];
          showResults(context);
        },
        leading: Icon(Icons.forum),
        title: RichText(
          text: TextSpan(
            text: _suggestionList[index],
            style: TextStyle(color: Colors.black54),
            // color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      itemCount: _suggestionList.length,
    );
  }
}
