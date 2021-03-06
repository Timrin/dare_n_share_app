import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/screens/authenticate.dart';
import 'package:dare_n_share_app/screens/onboarding_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login_user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthLogic _authLogic = AuthLogic.instance;
    return StreamBuilder<String>(
      stream: _authLogic.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print("Wrapper stream rebuild");
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.hasData ? Home(userId: snapshot.data,) : OnboardingWrapper();
        } else {
          return OnboardingWrapper();
        }
      },
    );
  }
}
