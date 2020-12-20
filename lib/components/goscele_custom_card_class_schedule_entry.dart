import 'package:flutter/cupertino.dart';

class CustomCardClassScheduleEntry extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rightSubtitle;

  CustomCardClassScheduleEntry(this.title, this.subtitle, this.rightSubtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            this.title,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(this.subtitle),
              Text(this.rightSubtitle),
            ],
          )
        ],
      ),
    );
  }
}
