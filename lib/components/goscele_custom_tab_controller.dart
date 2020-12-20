import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_tab.dart';

class CustomTabController extends StatelessWidget {
  final String appBarTitle;
  final List<CustomTab> tabs;
  final List<Widget> children;
  final List<Widget> actions;
  final Color backgroundColor;

  CustomTabController({
    @required this.appBarTitle,
    @required this.tabs,
    @required this.children,
    this.actions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
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
