import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/models/participant.dart';
import 'package:dare_n_share_app/screens/widgets/dare_info_card.dart';
import 'package:dare_n_share_app/screens/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

///@author Timothy Timrin & Karolina Hammar
///Class to se details and progress of active dare

class DareDetails extends StatefulWidget {
  final Dare dare;
  final DareLogic darelogic = DareLogic.instance;

  DareDetails({Key key, this.dare}) : super(key: key);

  @override
  _DareDetailsState createState() => _DareDetailsState();
}

class _DareDetailsState extends State<DareDetails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
                "Vegan dare with ${widget.dare.participantOpponent.user.name}"),
            centerTitle: true,
            actions: <Widget>[

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: <Widget>[
                DareInfoCard(dareConfig: widget.dare.dareConfig,),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Score",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: UserAvatar(widget.dare.participantUser.user.uid),
                          title: Text("You"),
                        ),
                        scopeProgressIndicator(widget.dare.participantUser),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: UserAvatar(widget.dare.participantOpponent.user.uid),
                          title: Text(widget.dare.participantOpponent.user.name),
                        ),
                        scopeProgressIndicator(widget.dare.participantOpponent),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.dare.dareConfig.getSuccessQuestion()),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[boxCheckYes(), boxCheckNo()],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
  }

  Widget scopeProgressIndicator(Participant participant) {
    return StepProgressIndicator(
        size: 36,
        totalSteps: widget.dare.scopeLength, //TODO Should be scope length
        customColor: (index) {
          if (index >= participant.score.length) {
            return Colors.grey;
          } else if (participant.score[index] == true) {
            return Colors.green;
          } else if (participant.score[index] == false) {
            return Colors.red;
          }
          return Colors.grey;
        },
        customStep: (index, color, _) => color == Colors.green
            ? Container(
                color: color,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : color == Colors.red
                ? Container(
                    color: color,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  )
                : Container(
                    color: color,
                  ));
  }

  Widget boxCheckYes() {
    //Should only be editable once a day
    return RaisedButton(
        child: Text("Yes 😎"),
        onPressed: () {
          if (isScoringAvailable()) {
            print("Score yes sent");

              widget.darelogic
                  .reportScore(widget.dare.dareId,
                      widget.dare.dareConfig.getObjectiveType(), true)
                  .then((success) {
                    print(success);
                if (success) {
                  widget.dare.participantUser.score.add(true);
                  setState(() {});
                } else {
                  //Could now score tell user why
                }
              }).catchError((error) {
                //Could now score tell user why
                print(error);
              });

          } else {
            _scaffoldKey.currentState.
            showSnackBar(SnackBar(content: Text("Wait until tomorrow to report score")));
          }
        },
      );
  }

  Widget boxCheckNo() {
    //Should only be editable once a day

    return RaisedButton(
        child: Text("No 🙈"),
        onPressed: () {
          if (isScoringAvailable()) {
            print("Score no sent");

              widget.darelogic
                  .reportScore(widget.dare.dareId,
                  widget.dare.dareConfig.getObjectiveType(), false)
                  .then((success) {
                if (success) {
                  widget.dare.participantUser.score.add(false);
                  setState(() {});
                } else {
                  //Could now score tell user why
                }
              }).catchError((error) {
                //Could now score tell user why
              });

          } else {
            _scaffoldKey.currentState.
            showSnackBar(SnackBar(content: Text("Wait until tomorrow to report score")));
          }
        },
      );
  }


  ///Method will either be active and allow a user to add score, or reject
  bool isScoringAvailable() {
    bool isScoringAvailable = false;
    List scoreArray = widget.dare.participantUser.score;
    int daysPassed = widget.dare.getDaysPassed();

    if ((scoreArray.length < daysPassed) &&
        (scoreArray.length < widget.dare.scopeLength)) {
      isScoringAvailable = true;
    }
    return isScoringAvailable;
  }
}
