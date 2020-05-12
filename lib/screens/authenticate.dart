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
    return Scaffold(
      backgroundColor: ColorDesign.colorAppbar[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          _loginWidget(context),
          _registerWidget(context),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _loginWidget(BuildContext context) {
    return Card(
      color: ColorDesign.colorProfile[200],
      margin: EdgeInsets.all(12.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginUser()));
        },
      ),
    );
  }

  Widget _registerWidget(BuildContext context) {
    return Card(
      color: ColorDesign.colorProfile[200],
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
            child: Text(
              'Register',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        onTap: () {
        },
      ),
    );
  }
}
