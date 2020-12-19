import 'package:flutter/material.dart';
import 'package:goscele/pages/Login.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Login(),
        ),
      ),
    ),
  );
}