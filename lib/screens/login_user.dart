

import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Author Karolina Hammar
///Class to login existing user

//todo add logic to check username and password

class LoginUser extends StatefulWidget{
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
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
              icon: Icon(Icons.home
              , color: ColorDesign.colorProfile,
              ),
              text: "home",
            ),
            Tab(
              icon: Icon(Icons.face,
              color: ColorDesign.colorProfile,),
              text: "profile",
            ),
          ],
        ),
      )
      ,
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
          buttonLogin(context)
        ],
      ),
      ));
  }

  Widget enterExistingUsername() {
    return TextFormField(
    );
  }

  Widget enterExistingPassword() {
    return TextFormField(
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
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => Home()));
        },
      ),
    );
  }
}