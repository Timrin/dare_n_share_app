import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/models/participant.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DetailsOfDare extends StatelessWidget {
  final Dare dare;

  DetailsOfDare({Key key, this.dare}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vegan dare with ${dare.participant2.user.name}"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(dare.dareConfig.getTitle()),
          ),
          Center(
            child: Text("vs"),
          ),
          Center(
            child: Text(dare.participant2.user
                .name), //TODO refactor, participant2 might not be the opponent, perform during init
          ),
          SizedBox(
            height: 60,
          ),
          Text("You"),
          SizedBox(
            height: 20,
          ),
          scopeProgressIndicator(dare.participant1),
          SizedBox(
            height: 30,
          ),
          Text(dare.participant2.user.name),
          SizedBox(
            height: 20,
          ),
          scopeProgressIndicator(dare.participant2),
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
    );
  }

  //Build the yes_no ObjectiveType progress indicator
  Widget scopeProgressIndicator(Participant participant) {
    return StepProgressIndicator(
        size: 36,
        totalSteps: dare.scopeLength, //TODO Should be scope length
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
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(child: Text("Yes")),
        ),
        onTap: () {
          //TODO add navigation or right output score
        },
      ),
    );
  }

  Widget boxCheckNo() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(child: Text("No")),
        ),
        onTap: () {
          //TODO add navigation or right output
        },
      ),
    );
  }
}
