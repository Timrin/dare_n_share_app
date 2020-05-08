import 'package:dare_n_share_app/controllers/auth_logic.dart';
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
    AuthLogic _authLogic = Provider.of<Controller>(context).authLogic;
    return StreamBuilder<String>(
      stream: _authLogic.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print("Wrapper stream rebuild");
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.hasData ? Home(userId: snapshot.data,) : Authenticate();
        } else {
          return Authenticate();
        }
      },
    );
  }
}
