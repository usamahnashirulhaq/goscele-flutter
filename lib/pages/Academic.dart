import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengumuman Akademis"),
      ),
    );
  }
}
