import 'package:flutter/material.dart';

class ForumDataSearch extends SearchDelegate<String> {
  List<String> _data = [
    "Pengumuman Akademis",
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
  List<String> _recent = ["Pengumuman Akademis"];

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
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.grey,
        child: Center(
          child: Text("Not Implemented yet"),
        ),
      ),
    );
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    final _suggestionList = query.isEmpty
        ? _recent
        : _data.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          _suggestionList.add(query);
          showResults(context);
        },
        leading: Icon(Icons.forum),
        title: RichText(
            text: TextSpan(
                text: _suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black54),
                    // color: Colors.black87, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: _suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.black54))
            ])),
      ),
      itemCount: _suggestionList.length,

    );
  }
}
