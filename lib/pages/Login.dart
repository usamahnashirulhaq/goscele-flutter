import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goscele/components/goscele_sign_in_button.dart';
import 'package:goscele/viewmodels/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return 'Username is required.';
                            else return null;
                          },
                          decoration: InputDecoration(labelText: 'Username'),
                          onEditingComplete: () {
                            _formKey.currentState.validate();
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (value) => username = value,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return 'Password is required.';
                            else return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password'),
                          onEditingComplete: () {
                            _formKey.currentState.validate();
                            FocusScope.of(context).unfocus();
                          },
                          onSaved: (value) => password = value,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SignInButton(
                    text: "Sign In",
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        model.login(username, password);
                      }
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
      },
    );
  }
}
