import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:flutter/material.dart';

import '../wrapper.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool _valid;

  String _email;
  String _password;

  Pattern _pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
      r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(('
      r'[a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 30),
              ),
            ),
            enterExistingEmail(),
            enterExistingPassword(),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  AuthLogic.instance
                      .handleSignIn(_email, _password)
                      .then((user) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                      (Route<dynamic> route) => false,
                    );
                  }).catchError((error) {
                    String errorMessage;
                    switch (error.code) {
                      case "ERROR_INVALID_EMAIL":
                        errorMessage = "Your email address appears to be malformed.";
                        break;
                      case "ERROR_WRONG_PASSWORD":
                        errorMessage = "Your password is wrong.";
                        break;
                      case "ERROR_USER_NOT_FOUND":
                        errorMessage = "User with this email doesn't exist.";
                        break;
                      case "ERROR_USER_DISABLED":
                        errorMessage = "User with this email has been disabled.";
                        break;
                      case "ERROR_TOO_MANY_REQUESTS":
                        errorMessage = "Too many requests. Try again later.";
                        break;
                      case "ERROR_OPERATION_NOT_ALLOWED":
                        errorMessage = "Signing in with Email and Password is not enabled.";
                        break;
                      default:
                        errorMessage = "An undefined Error happened.";
                    }
                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar(content: Text(errorMessage)));
                  });
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Widget enterExistingEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(hintText: 'Email'),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (email) {
        if (!_validateEmail(email)) {
          return "Please enter valid email";
        }
        return null;
      },
    );
  }

  Widget enterExistingPassword() {
    return TextFormField(
      decoration: new InputDecoration(hintText: 'Password'),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      obscureText: true,
    );
  }

  ///Method to validate if entered password or email are correct

  void _validate() {
    bool isValid;
    if (_password.length < 8) {
      isValid = false;
      _errorMessageDialog();
    } else if (_validateEmail(_email) == false) {
      isValid = false;
      _errorMessageDialog();
    } else {
      isValid = true;
    }
    //FIXME: Should this method handle navigation?
    if (isValid == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Wrapper()));
    }
    this._valid = isValid;
    //return isValid;
  }

  ///Method to validate use of characters in email

  bool _validateEmail(String email) {
    RegExp reg = new RegExp(_pattern);
    return (!reg.hasMatch(email)) ? false : true;
  }

  ///Method to display message dialog if entered email or password is incorrect

  Future<void> _errorMessageDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,

        ///User must tap button to dismiss message
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("You´ve entered a wrong password or email, "
                "\n Password must be more than 7 characters"),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
