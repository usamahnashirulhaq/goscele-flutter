import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 172, 223, 1),
        title: Text("Miscellaneous"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "User Info",
                      style: TextStyle(fontSize: 23),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Full Name",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Someone"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Username",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Someone"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Account",
                      style: TextStyle(fontSize: 23),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, ),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Sign out",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Delete app cache and exit"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "About Application",
                      style: TextStyle(fontSize: 23),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Application Name",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("-"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Application Version",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("-"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Development Channel",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Keep update with us"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Github Repository",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("-"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Lisence",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("MIT"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
