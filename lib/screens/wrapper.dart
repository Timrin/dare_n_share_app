import 'package:dare_n_share_app/controllers/controller.dart';
import 'package:dare_n_share_app/screens/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider.of<Controller>(context).userId == null ? Authenticate():Home();
  }

}