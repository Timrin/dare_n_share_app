import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:flutter/material.dart';

///@author Karolina Hammar & Timothy Timrin
///LoginForm is responsible for building and validating the login
/// form that users may use to login to the app.
/// The form also includes the button which executes the login call
/// to the authService
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

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

                    //The login page should be the page on top of
                    // Wrapper in the Navigator stack. Therefor pop should
                    // bring the user back to Wrapper, which should update
                    // from the AuthStateChange.
                    Navigator.pop(context);

                  }).catchError((error) {
                    String errorMessage;
                    switch (error.code) {
                      case "ERROR_INVALID_EMAIL":
                        errorMessage =
                            "Your email address appears to be malformed.";
                        break;
                      case "ERROR_WRONG_PASSWORD":
                        errorMessage = "Your password is wrong.";
                        break;
                      case "ERROR_USER_NOT_FOUND":
                        errorMessage = "User with this email doesn't exist.";
                        break;
                      case "ERROR_USER_DISABLED":
                        errorMessage =
                            "User with this email has been disabled.";
                        break;
                      case "ERROR_TOO_MANY_REQUESTS":
                        errorMessage = "Too many requests. Try again later.";
                        break;
                      case "ERROR_OPERATION_NOT_ALLOWED":
                        errorMessage =
                            "Signing in with Email and Password is not enabled.";
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
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  ///Method for building the email TextFormField
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

  ///Method for building the password TextFormField
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

  ///Validator method for the email TextFormField
  bool _validateEmail(String email) {
    RegExp reg = new RegExp(_pattern);
    return (!reg.hasMatch(email)) ? false : true;
  }
}
