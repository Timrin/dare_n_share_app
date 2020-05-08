import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/home.dart';
import 'package:dare_n_share_app/screens/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///@author Karolina Hammar & Timothy Timrin
///Class to login existing user

//todo add logic to check username and password

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool _valid;

  String _email;
  String _password;

  Pattern _pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
      r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(('
      r'[a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dare n share"),
        backgroundColor: ColorDesign.colorAppbar,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
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
            buttonLogin(context)
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

  Widget buttonLogin(BuildContext context) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Center(
          child: Text("Login"),
        ),
      ),
      onPressed: () {
        print("$_email $_password");

        _validate();
        if (_valid == true) {
          AuthLogic().handleSignIn(_email, _password).then((user) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Wrapper()),
              (Route<dynamic> route) => false,
            );
          }).catchError((error) {
            //TODO: Error handling
            print(error);
          });
        }
      },
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
                "\n  Password must be more than 7 characters"),
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
