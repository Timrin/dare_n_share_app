import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/widgets/register_form.dart';
import 'package:dare_n_share_app/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///@author Karolina Hammar
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

  Pattern _emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
      r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(('
      r'[a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Dare n share"),
            backgroundColor: ColorDesign.colorAppbar,
          ),
          body: RegisterForm()


        );
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
      keyboardType: TextInputType.emailAddress,
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
      validator: (value){
        if(value.isEmpty) {
          return "Please confirm password";
        } return null;
      },
      obscureText: true,
    );
  }

  Widget buttonCreateUser(BuildContext context) {
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
          if(_isValid) {
            AuthLogic.instance.handleRegistration(_email, _userName, _password).then((user) {
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

  ///Method to validate that:
  ///1. Password is 8 characters or more
  ///2. Password and confirm password match
  ///3. Validates that email is or right characters
  ///Check that email is a "real" email is done by firebase

  void _validate() {
    bool isValid = true;
    if (_password.length < 8) {
      isValid = false;
      print("Enter 8 characters");
    } else if (_password.compareTo(_confirmPassword) != 0) {
      isValid = false;
    } else if(_validateEmail(_email) == false) {
      isValid = false;
    } else {
      isValid = true;
    }

    this._isValid = isValid;
  }

  bool _validateEmail(String email) {
    RegExp reg = new RegExp(_emailPattern);
    return (!reg.hasMatch(email)) ? false : true;
  }

}
