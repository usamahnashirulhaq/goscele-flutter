import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_custom_text_field.dart';
import 'package:goscele/components/goscele_sign_in_button.dart';

import 'Home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "images/ic_launcher.png",
                height: 100,
              ),
              Text(
                "GoScele",
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 1,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Column(
            children: [
              CustomTextField(
                label: "Username",
              ),
              CustomTextField(
                label: "Password",
                obscure: true,
              ),
              SignInButton(
                text: "Sign In",
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                color: Color.fromRGBO(0, 172, 223, 1),
                textColor: Colors.white,
              )
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
    );
  }
}
