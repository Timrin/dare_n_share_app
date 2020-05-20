import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/dare_configurations/exercise_dare.dart';
import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/dare_configurations/vegan_dare.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/add_friend.dart';
import 'package:dare_n_share_app/screens/set_up_dare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///@authors Timothy Timrin & Karolina Hammar
///First class and screen that eventually will display all options of dare objectives.

class SelectDare extends StatefulWidget {
  @override
  _SelectDareState createState() => _SelectDareState();
}

class _SelectDareState extends State<SelectDare> {
  SetUpDare setUpDare;

  //This variable holds the future of the friends list
  //It is initialized in initState(). This way the friend list api call is
  // only done on init and not every time the widgets gets rebuilt
  List _friendList = List();

  @override
  void initState() {
    super.initState();

    //Load the friends list on init
    print("Something");
    UserLogic.instance.getFriends().then((friendList) {
      setState(() {
        _friendList = friendList;
      });
    }).catchError((error) {
        print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Add home and profile navigation
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Dare"),
        backgroundColor: ColorDesign.colorAppbar,
      ),
      body: ListView(
        children: <Widget>[
          selectDareCard(context, VeganDare()),
          selectDareCard(context, ExerciseDare())
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddFriend()));
        },
        label: Text('Add friend'),
        icon: Icon(Icons.person_add),
        backgroundColor: Colors.blue,
      ),
    );
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SetUpDare(dare: dare)));
        },
      ),
    );
  }
}
