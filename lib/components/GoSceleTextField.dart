import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoSceleTextField extends StatelessWidget {
  final String label;
  final bool obscure;

  GoSceleTextField({
    this.label,
    this.obscure: false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.label),
          TextField(
            decoration: InputDecoration(
              hoverColor: Color.fromRGBO(0, 172, 223, 1),
            ),
            obscureText: this.obscure,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
    );
  }
}
