import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/screens/setupdare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/**
 * First class and screen that eventually will display all options of dare objectives.
 */

class SelectDare extends StatelessWidget{
  SetUpDare setUpDare;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dara n Share"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column (
          children: <Widget>[SizedBox(height: 20,), setUpDare.dontEatMeat()],
        ),
      ),
    );
  }
}

//Second screen that will show the selected dare, and will provide the user to select length of dare, to select friend as an opponent, and to start the dare.

