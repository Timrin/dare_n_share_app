import 'package:dare_n_share_app/controllers/controller.dart';
import 'package:dare_n_share_app/screens/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login_user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Provider.of<Controller>(context).userId == null ? Authenticate():Home();
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.providerData.length ==
              1) { // logged in using email and password
            return Home();
          } else { // logged in using other providers
            return Home();
          }
        } else {
          return LoginUser();
        }
      },
    );
  }


}