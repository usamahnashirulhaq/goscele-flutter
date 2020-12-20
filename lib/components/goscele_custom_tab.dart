import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;
  final IconData icon;

  CustomTab({
    @required this.title,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Text(title),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
