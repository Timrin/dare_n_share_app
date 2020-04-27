import 'package:dare_n_share_app/models/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Author Karolina Hammar
///Class to register user with all new information of username, password, and
///e-mail

class RegisterUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Dare n share"
          ),
        ),
        backgroundColor: ColorDesign.colorAppbar,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text("Enter username"),
          SizedBox(height: 10,),
          enterUsername(),
          SizedBox(height: 30,),
          Text("Enter e-mail"),
          SizedBox(height: 10,),
          enterEmail(),
          SizedBox(
            height: 30,),
          Text("Enter password"),
          SizedBox(height: 10,),
          enterPassword(),
          SizedBox(height: 30,),
          Text("Confirm password"),
          SizedBox(height: 10,),
          confirmPassword(),
          SizedBox(height: 50,),
          Center(
            child: buttonCreateUser(),
          )
        ],
      ),
    );
  }

  Widget enterUsername() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Enter username"),
    );
  }

  Widget enterEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Enter e-mail"
      ),
    );
  }

  Widget enterPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Enter password"
      ),
    );
  }

  Widget confirmPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Confirm password"
      ),
    );
  }

  Widget buttonCreateUser() {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(
            child: Text("Create user"
            ),
          ),
        ),
        onTap: () {
          //Todo add navigation to homepage
        },
      ),
    );
  }


}