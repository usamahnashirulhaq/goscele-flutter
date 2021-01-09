import 'package:flutter/cupertino.dart';

class CustomCardCourse extends StatelessWidget {
  final String courseShortname;

  CustomCardCourse(this.courseShortname);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            this.courseShortname,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
