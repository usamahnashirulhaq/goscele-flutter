import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_card_class_schedule_entry.dart';

class CustomCard extends StatelessWidget {
  final String title;
  List<CustomCardClassScheduleEntry> fills;

  CustomCard({@required this.title, this.fills});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bodyWidget = [
      Container(
        child: Text(
          this.title,
          style: TextStyle(fontSize: 23),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
    ];

    if (fills != null && fills.isNotEmpty) {
      bodyWidget.addAll(fills);
    } else {
      bodyWidget.add(
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "(empty)",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      );
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: bodyWidget,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
