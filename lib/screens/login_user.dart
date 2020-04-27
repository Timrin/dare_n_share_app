

import 'package:dare_n_share_app/models/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Author Karolina Hammar
///Class to login existing user

class LoginUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Dare n share"),
        ),
        backgroundColor: ColorDesign.colorAppbar,),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50,),
          Center(
            child: Text("Login",
              style: TextStyle(fontSize: 30),),
          ),
          SizedBox(height: 50,),
          Text("Enter username"),
          SizedBox(height: 10,),
          enterExistingUsername(),
          SizedBox(height: 30,),
          Text("Enter password"),
          SizedBox(height: 10,),
          enterExistingPassword(),
          SizedBox(height: 50,),
          buttonLogin()
        ],
      ),
    );
  }

  Widget enterExistingUsername() {
    return TextFormField(
    );
  }

  Widget enterExistingPassword() {
    return TextFormField(
    );
  }

  Widget buttonLogin() {
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
          //TODO add navigation to homescreen
        },
      ),
    );
  }

}