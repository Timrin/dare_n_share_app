import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:flutter/material.dart';

///@author Karolina Hammar & Timothy Timrin
///RegisterForm is responsible for building and validating the registration
/// form that users may use to register to the app.
/// The form also includes the button which executes the register call
/// to the authService
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _password = "";
  String _email;
  String _userName;

  //Regex pattern for validating email format
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

                    //The login page should be the page on top of
                    // Wrapper in the Navigator stack. Therefor pop should
                    // bring the user back to Wrapper, which should update
                    // from the AuthStateChange.
                    Navigator.pop(context);

                  }).catchError((error) {
                    print(error);
                    String errorMessage;
                    switch (error.code) {
                      case "ERROR_WEAK_PASSWORD":
                        errorMessage = "Select a stronger password";
                        break;
                      case "ERROR_INVALID_EMAIL":
                        errorMessage = "Email is invalid";
                        break;
                      case "ERROR_EMAIL_ALREADY_IN_USE":
                        errorMessage = "Email is alreade in use.";
                        break;
                      case "ERROR_DARE_SERVER":
                        errorMessage = "We seem to be having issues with our service, apologies.";
                        break;
                      default:
                        errorMessage = "An undefined Error happened.";
                    }
                    //The error message is displayed to the user in a snackbar
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

  ///Method for building the username TextFormField
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

  ///Method for building the email TextFormField
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

  ///Method for building the password TextFormField
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

  ///Method for building the confirm password TextFormField
  Widget enterConfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Confirm password"),
      validator: (confirmPassword) {
        return _validateConfirmPassword(confirmPassword);
      },
      obscureText: true,
    );
  }

  ///Validator method for the username TextFormField
  String _validateUsername(String username) {
    if (username == "") {
      return "Please enter a username";
    }
    //Todo add length for too short and too long usernames
    return null;
  }

  ///Validator method for the email TextFormField
  bool _validateEmail(String email) {
    RegExp reg = new RegExp(_emailPattern);
    return (!reg.hasMatch(email)) ? false : true;
  }

  ///Validator method for the password TextFormField
  String _validatePassword(String password) {
    if (password.length < 8) {
      return "Password needs atleast 8 characters";
    }
    return null;
  }

  ///Validator method for the confirm password TextFormField
  String _validateConfirmPassword(String password) {
    if (_password.compareTo(password) != 0 || (password == "")) {
      return "Password does not match";
    }
    return null;
  }
}
