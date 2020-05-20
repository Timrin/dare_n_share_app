import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///@author Karolina Hammar & Timothy Timrin
///LoginUser is the screen which contains the login form
class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dare n share"),
        centerTitle: true,
        backgroundColor: ColorDesign.colorAppbar,
      ),
      body: LoginForm() //The content body is a LoginForm
    );
  }
}
