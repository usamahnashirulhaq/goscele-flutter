import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;

  CustomTextField({
    this.label,
    this.obscure: false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2),
              labelText: label,
              labelStyle: TextStyle(
                letterSpacing: 0.5,
              ),
              hoverColor: Color.fromRGBO(0, 172, 223, 1),
            ),
            obscureText: this.obscure,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
    );
  }
}
