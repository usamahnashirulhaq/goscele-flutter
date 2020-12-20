import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goscele/pages/Home.dart';
import 'package:goscele/pages/Login.dart';

void main() {
  /**
   * @statusBarColor mengubah status bar aplikasi menjadi warna biru dengan kode ARGB(0, 142, 223, 1)
   */
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(0, 172, 223, 1),
  ));


  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Login(), //@TODO Ganti ke Login() kalau udah
        ),
      ),
    ),
  );
}
