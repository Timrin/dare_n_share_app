import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:flutter/material.dart';

import '../wrapper.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _password = "";
  String _email;
  String _userName;

  Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
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
              child: Text("Register", style: TextStyle(fontSize: 30)),
            ),
            SizedBox(
              height: 10,
            ),
            enterUsername(),
            enterEmail(),
            enterPassword(),
            enterConfirmPassword(),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  print("$_email $_userName $_password");

                  AuthLogic.instance
                      .handleRegistration(_email, _userName, _password)
                      .then((user) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                      (Route<dynamic> route) => false,
                    );
                  }).catchError((error) {
                    String errorMessage;
                    switch (error.code) {
                      case "ERROR_WEAK_PASSWORD":
                        errorMessage = "Select a stronger password";
                        break;
                      case "ERROR_INVALID_EMAIL":
                        errorMessage = "Email is invalid";
                        break;
                      case "ERROR_EMAIL_ALREADY_IN_USE":
                        errorMessage = "This email is alreade in use";
                        break;
                      default:
                        errorMessage = "An undefined Error happened.";
                    }
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(errorMessage)));
                  });


                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Widget enterUsername() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter username"),
      onChanged: (value) {
        setState(() {
          _userName = value;
        });
      },
      validator: (username) {
        return _validateUsername(username);
      },
    );
  }

  Widget enterEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: "Enter email"),
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

  Widget enterPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter password"),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (password) {
        return _validatePassword(password);
      },
      obscureText: true,
    );
  }

  Widget enterConfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Confirm password"),
      validator: (confirmPassword) {
        return _validateConfirmPassword(confirmPassword);
      },
      obscureText: true,
    );
  }

/*  Widget buttonCreateUser(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(
            child: Text("Login"),
          ),
        ),
        onTap: () {
          print("$_email $_password");

          _validate();
          if (_isValid) {
            AuthLogic.instance
                .handleRegistration(_email, _userName, _password)
                .then((user) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Wrapper()),
                (Route<dynamic> route) => false,
              );
            }).catchError((error) {
              //TODO: Error handling
              print("Error: $error");
            });
          }
        },
      ),
    );
  }

 */

  ///Method to validate that:
  ///1. Password is 8 characters or more
  ///2. Password and confirm password match
  ///3. Validates that email is or right characters
  ///Check that email is a "real" email is done by firebase

  String _validateUsername(String username) {
    if (username == "") {
      return "Please enter a username";
    }
    //Todo add length for too short and too long
    return null;
  }

  bool _validateEmail(String email) {
    RegExp reg = new RegExp(_emailPattern);
    return (!reg.hasMatch(email)) ? false : true;
  }

  String _validatePassword(String password) {
    if (password.length < 8) {
      return "Password needs atleast 8 characters";
    }
    return null;
  }

  String _validateConfirmPassword(String password) {
    print(".$password.");
    if (_password.compareTo(password) != 0 || (password == "")) {
      return "Password does not match";
    }
    return null;
  }
}
