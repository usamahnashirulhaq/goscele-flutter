import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_tab.dart';

class CustomTabController extends StatelessWidget {
  final String appBarTitle;
  final List<CustomTab> tabs;
  final List<Widget> children;
  final List<Widget> actions;

  CustomTabController({
    @required this.appBarTitle,
    @required this.tabs,
    @required this.children,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          bottom: TabBar(
            tabs: this.tabs,
          ),
          actions: actions,
        ),
        body: TabBarView(
          children: this.children,
        ),
      ),
    );
  }
}
