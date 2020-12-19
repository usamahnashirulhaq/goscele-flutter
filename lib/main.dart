import 'package:flutter/material.dart';
import 'package:goscele/pages/Home.dart';
import 'package:goscele/pages/Login.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Home(), //@TODO Ganti ke Login() kalau udah
        ),
      ),
    ),
  );
}
