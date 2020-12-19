import 'package:flutter/cupertino.dart';

import 'custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0, letterSpacing: 1.5),
          ),
          color: color,
          onPressed: onPressed,
        );
}
