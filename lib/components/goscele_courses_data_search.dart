import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoursesDataSearch extends SearchDelegate<String> {
  List<String> _data = [];
  List<String> _recent = [];

  @override
  String get searchFieldLabel => "Find course";

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
        : _data.where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();

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
                    color: Colors.black87, fontWeight: FontWeight.bold),
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
