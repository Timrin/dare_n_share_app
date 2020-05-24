import 'package:dare_n_share_app/constants/colors.dart';
import 'package:dare_n_share_app/screens/widgets/register_form.dart';
import 'package:flutter/material.dart';

///@author Karolina Hammar
///RegisterUser is the screen which contains the user registration form
class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dare n share"),
          centerTitle: true,
          backgroundColor: ColorDesign.colorPrimary,
        ),
        body: RegisterForm() //The content body is a RegisterForm
    );
  }
}
