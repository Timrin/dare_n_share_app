import 'package:dare_n_share_app/dares/enums/objective_goals.dart';
import 'package:dare_n_share_app/dares/i_dare.dart';
import 'package:dare_n_share_app/dares/vegan_dare.dart';
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
        title: Text("Dare n Share"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column (
          children: <Widget>[SizedBox(height: 20,), selectDareCard(context, VeganDare())],
        ),
      ),
    );
  }

  Widget selectDareCard(BuildContext context, IDare iDare){ //Ca
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text(iDare.getTitle(), //Could insert typeOfdare instead, so that this could be reused
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SetUpDare(dare : iDare,)));
        },),
    );
  }
}

//Second screen that will show the selected dare, and will provide the user to select length of dare, to select friend as an opponent, and to start the dare.

