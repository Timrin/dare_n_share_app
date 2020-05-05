import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Author Karolina Hammar
///Class to login existing user

//todo add logic to check username and password

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Dare n share"),
        ),
        backgroundColor: ColorDesign.colorAppbar,
      ),
      body: ListView(
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
          enterExistingUsername(),
          enterExistingPassword(),
          buttonLogin(context)
        ],
      ),
    );
  }

  Widget enterExistingUsername() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration: new InputDecoration(hintText: 'Email'),
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
      ),
    );
  }

  Widget enterExistingPassword() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration: new InputDecoration(hintText: 'Password'),
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
        obscureText: true,
      ),
    );
  }

  Widget buttonLogin(BuildContext context) {
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

          AuthLogic().handleSignIn(_email, _password).then((user) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
            );
          }).catchError((error) {
            //TODO: Error handling
            print(error);
          });
        },
      ),
    );
  }
}
