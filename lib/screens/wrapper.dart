import 'package:dare_n_share_app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login_user.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider.of<Controller>(context).userId == null ? LoginUser():Home();
  }

}