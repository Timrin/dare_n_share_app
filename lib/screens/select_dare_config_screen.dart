import 'package:dare_n_share_app/dare_configurations/exercise_dare.dart';
import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/dare_configurations/vegan_dare.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/set_up_dare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///@Authors Timothy Timrin & Karolina Hammar
///First class and screen that eventually will display all options of dare objectives.

class SelectDare extends StatelessWidget {
  SetUpDare setUpDare;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Select a Dare"),
            backgroundColor: ColorDesign.colorAppbar,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: ColorDesign.colorProfile,
                  ),
                  text: "home",
                ),
                Tab(
                  icon: Icon(
                    Icons.face,
                    color: ColorDesign.colorProfile,
                  ),
                  text: "profile",
                ),
              ],
            ),
          ),
          body: ListView(
            children: <Widget>[
              selectDareCard(context, VeganDare()),
              selectDareCard(context, ExerciseDare())
            ],
          ),
        ));
  }

  Widget selectDareCard(BuildContext context, IDare dare) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
          child: Center(
            child: Text(
              dare.getTitle(),
              //Could insert typeOfdare instead, so that this could be reused
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SetUpDare(
                        dare: dare,
                      )));
        },
      ),
    );
  }
}
