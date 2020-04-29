import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Author Karolina Hammar
///Class to register user with all new information of username, password, and
///email

//todo add logic to check password and email

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String _userName;
  String _email;
  String _password;
  String _confirmPassword;
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Dare n share"),
            ),
            backgroundColor: ColorDesign.colorAppbar,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: ColorDesign.colorProfile,
                  ),
                  text: "home",
                ),
                Tab(
                  icon: Icon(
                    Icons.face,
                    color: ColorDesign.colorProfile,
                  ),
                  text: "profile",
                ),
              ],
            ),
          ),
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text("Enter username"),
              SizedBox(
                height: 10,
              ),
              enterUsername(),
              SizedBox(
                height: 30,
              ),
              Text("Enter email"),
              SizedBox(
                height: 10,
              ),
              enterEmail(),
              SizedBox(
                height: 30,
              ),
              Text("Enter password"),
              SizedBox(
                height: 10,
              ),
              enterPassword(),
              SizedBox(
                height: 30,
              ),
              Text("Confirm password"),
              SizedBox(
                height: 10,
              ),
              confirmPassword(),
              SizedBox(
                height: 50,
              ),
              Center(
                child: buttonCreateUser(context),
              )
            ],
          ),
        ));
  }

  Widget enterUsername() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter username"),
      onChanged: (value) {
        setState(() {
          _userName = value;
        });
        _validate();
      },
    );
  }

  Widget enterEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter email"),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
        _validate();
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
        _validate();
      },
      obscureText: true,
    );
  }

  Widget confirmPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Confirm password"),
      onChanged: (value) {
        setState(() {
          _confirmPassword = value;
        });
        _validate();
      },
      obscureText: true,
    );
  }

  Widget buttonCreateUser(BuildContext context) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Center(
          child: Text("Create user"),
        ),
      ),
      onPressed: () {
        if (_isValid) {
          print(_userName);
          print(_email);
          print(_password);
          print(_confirmPassword);

          //TODO: Error handling
          AuthLogic().handleRegistration(_email, _password);
        } else {
          return null;
        }
      },
    );
  }

  ///Method to validate that:
  ///1. Password is 8 characters or more
  ///2. Password and confirm password match

  void _validate() {
    //Validate that password and confirm password match
    //Validate that email is an email
    bool isValid = true;
    if (_password.length < 8) {
      isValid = false;
      print("Enter 8 characters");
    } else if (_password.compareTo(_confirmPassword) != 0) {
      isValid = false;
    }

    this._isValid = isValid;
  }
}
