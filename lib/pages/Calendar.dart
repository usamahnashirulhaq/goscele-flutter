import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/pages/subpages/CalendarViewSection.dart';
import 'package:goscele/pages/subpages/JadwalKelasViewSection.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Calendar"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Text("Deadline"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.access_time),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Text("Class Schedule"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CalendarViewSection(),
              JadwalKelasViewSection(),
            ],
          ),
        ),
      ),
    );
  }
}
