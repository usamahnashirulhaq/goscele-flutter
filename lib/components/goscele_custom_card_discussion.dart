import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardDiscussion extends StatelessWidget {
  final String author;
  final DateTime postdate;
  final String message;
  final bool is_parent;
  final bool has_child;

  CustomCardDiscussion(
      this.author, this.postdate, this.message, this.is_parent, this.has_child);

  @override
  Widget build(BuildContext context) {
    Widget bottomRow;
    if (this.has_child || this.is_parent) {
      bottomRow = Padding(
        padding: EdgeInsets.only(top: 5),
      );
    } else {
      bottomRow = Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Text(
              "",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "view replies...",
              style: TextStyle(fontSize: 12),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  "by " + this.author,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                width: 150.0,
              ),
              Text(
                DateFormat('dd MMMM yyyy H:mm').format(postdate),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          Text(
            this.message,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.justify,
          ),
          bottomRow
        ],
      ),
    );
  }
}
