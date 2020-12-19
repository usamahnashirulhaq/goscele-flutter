
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/GoSceleTextField.dart';
import 'package:goscele/components/sign_in_button.dart';

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
                height: 140,
              ),
              Text(
                "GoScele",
                style: TextStyle(fontSize: 40),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Column(
            children: [
              GoSceleTextField(
                label: "Username",
              ),
              GoSceleTextField(
                label: "Password",
                obscure: true,
              ),
              SignInButton(
                text: "Sign In",
                onPressed: () {},
                color: Color.fromRGBO(0, 172, 223, 1),
                textColor: Colors.white,
              )
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
    );
  }
}
