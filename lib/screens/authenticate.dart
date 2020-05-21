import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/login_user.dart';
import 'package:dare_n_share_app/screens/register_user.dart';
import 'package:flutter/material.dart';
/**
 * @authors Timothy Timrin & Karolina Hammar
 */

///
///This class is the screen widget for login and registration
///
class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          buttonTheme: ButtonThemeData(
            buttonColor: ColorDesign.colorPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        height: 64,
      )),
      child: Scaffold(
        backgroundColor: ColorDesign.colorSecondary,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              _loginWidget(context),
              SizedBox(
                height: 16,
              ),
              _registerWidget(context),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginWidget(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Login',
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginUser()));
      },
    );
  }

  Widget _registerWidget(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Register',
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterUser()));
      },
    );
  }
}
