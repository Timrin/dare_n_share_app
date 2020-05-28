import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/dare_configurations/exercise_dare.dart';
import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/dare_configurations/vegan_dare.dart';
import 'package:dare_n_share_app/constants/colors.dart';
import 'package:dare_n_share_app/dare_configurations/workout_dare.dart';
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

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //TODO: Add home and profile navigation

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Select a Dare"),
        centerTitle: true,
        backgroundColor: ColorDesign.colorPrimary,
      ),
      body: ListView(
        children: <Widget>[
          selectDareCard(context, VeganDare()),
          selectDareCard(context, WorkoutDare())
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddFriend()))
              .then((_) {
            //This then method re-fetches the friend list after a friend has been added.
            //Without this the friend list isn't updated and the dare options are locked
            // if the user didn't have any friends prior to adding one.
            UserLogic.instance.getFriends().then((friendList) {
              setState(() {
                _friendList = friendList;
              });
            }).catchError((error) {
              print(error);
            });
          });
        },
        label: Text('Add friend'),
        icon: Icon(Icons.person_add),
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
          if (_friendList.isNotEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SetUpDare(dare: dare)));
          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Try adding a friend before starting a dare")));
          }
        },
      ),
    );
  }
}
