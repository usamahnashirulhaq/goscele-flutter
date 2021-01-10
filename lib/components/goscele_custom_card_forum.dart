import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardForum extends StatelessWidget {
  final String author;
  final DateTime postdate;
  final String message;

  CustomCardForum(this.author, this.postdate, this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                "by " + this.author,
                style: TextStyle(fontSize: 12, color: Colors.grey),
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
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            maxLines: 4,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          Row(
            children: [
              Text(
                "",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "view details...",
                style: TextStyle(fontSize: 12),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
    );
  }
}
