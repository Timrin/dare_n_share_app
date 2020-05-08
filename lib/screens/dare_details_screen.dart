import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/models/participant.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

///@author Timothy Timrin & Karolina Hammar
///Class to se details and progress of active dare

class DareDetails extends StatefulWidget {
  final Dare dare;

  DareDetails({Key key, this.dare}) : super(key: key);

  @override
  _DareDetailsState createState() => _DareDetailsState();
}

class _DareDetailsState extends State<DareDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Text(
            "Vegan dare with ${widget.dare.participantOpponent.user.name}"),
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
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(widget.dare.dareConfig.getTitle()),
          ),
          Center(
            child: Text("vs"),
          ),
          Center(
            child: Text(widget.dare.participantOpponent.user
                .name), //TODO refactor, participant2 might not be the opponent, check during init
          ),
          SizedBox(
            height: 60,
          ),
          Text("You"),
          SizedBox(
            height: 20,
          ),
          scopeProgressIndicator(widget.dare.participantUser),
          SizedBox(
            height: 30,
          ),
          Text(widget.dare.participantOpponent.user.name),
          SizedBox(
            height: 20,
          ),
          scopeProgressIndicator(widget.dare.participantOpponent),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text("Have you succeded today?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[boxCheckYes(), boxCheckNo()],
          )
        ],
      ),
      ));
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
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(child: Text("Yes")),
        ),
        onTap: () {
          if(isScoringAvailable()) {
            print("Score yes sent");
            widget.dare.participantUser.score.add(true);
            widget.dare.participantUser.score.add(false);
            setState(() {
            });
          } else {
            print("Scoring not possible");
          }
        },
      ),
    );
  }

  Widget boxCheckNo() {
    //Should only be editable once a day

    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(child: Text("No")),
        ),
        onTap: () {
          if(isScoringAvailable()) {
            print("Score no sent");
            widget.dare.participantUser.score.add(false);
            setState(() {
            });
          } else {
            print("Scoring not possible");
          }
        },
      ),
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
