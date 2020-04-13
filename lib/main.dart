import 'package:dare_n_share_app/screens/authenticate.dart';
import 'package:dare_n_share_app/screens/selectedare.dart';
import 'package:dare_n_share_app/screens/setupdare.dart';
import 'package:dare_n_share_app/services/dareService.dart';
import 'package:flutter/material.dart';
import 'package:dare_n_share_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  DareService dareService = new DareService();

  @override
  Widget build(BuildContext context) {
    return Provider<DareService>.value(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        SelectDare(),
      ), value: dareService,
    );
  }
}

