import 'dart:convert';

import 'package:dare_n_share_app/dare_configurations/enums/objective_types.dart';
import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/dare_configurations/vegan_dare.dart';
import 'package:dare_n_share_app/models/active_user.dart';
import 'package:dare_n_share_app/models/participant.dart';
import 'package:dare_n_share_app/models/user.dart';

class Dare {
  //Timestamps
  final DateTime start;
  final DateTime end;

  //Dare configuration
  final IDare dareConfig;

  final int scopeLength;

  //Users and score
  final Participant participantUser;
  final Participant participantOpponent;

  //Constructor
  Dare(
      {this.start,
      this.end,
      this.dareConfig,
      this.scopeLength,
      this.participantUser,
      this.participantOpponent});

  factory Dare.fromJson(jsonData) {
    Map<String, dynamic> dare = jsonDecode(jsonData);
    var participants = new List();

    //Determine dare config
    IDare dareConfig;
    String objectiveGoal = dare["objective"]["goal"];

    if (objectiveGoal == "NO_MEAT") {
      dareConfig = VeganDare();
    } else if (objectiveGoal == "exercise") {
      //TODO: handle exercise dare
    } else {
      //TODO: handle error
    }

    //The JSON body has to have 2 or more participants
    if (dare["participants"].length >= 2) {
      //Create the participant objects
      for (int i = 0; i < dare["participants"].length; i++) {
        String userName = dare["participants"][i]["name"];
        String uid = dare["participants"][i]["uid"];

        if (dareConfig.getObjectiveType() == ObjectiveTypes.yes_no) {
          List score = dare["participants"][i]["score"];
          if (ActiveUser.loggedInUserId == uid) {
            participants.insert(
                0,
                Participant(
                    user: User(uid: uid, name: userName), score: score));
          } else {
            participants.add(Participant(
                user: User(uid: uid, name: userName), score: score));
          }
        } else {
          throw Exception("Malformed Dare, unknown objective type");
        }

        print("Created: ${participants[i].toString()}");
      }
    } else {
      throw Exception("Malformed Dare, missing participants");
    }

    //Configure scope
    String scopeType = dare["scope"]["type"];
    int scopeLength = dare["scope"]["length"];
    DateTime start;
    DateTime end;

    if (scopeType == "TIMED") {
      start = DateTime.tryParse(dare["start"]);
      end = DateTime.tryParse(dare["end"]);
    } else {
      throw ("Malformed Dare, unknown scope type");
    }

    return Dare(
        start: start,
        end: end,
        dareConfig: dareConfig,
        scopeLength: scopeLength,
        participantUser: participants[0],
        participantOpponent: participants[1]);
  }

  ///This method returns the ceiling of number of days that have passed
  ///since the dares start date. If 25 hours have passed since the start of a
  ///dare, two days will be returned by this method.
  int getDaysPassed() {
    int hoursPassed = DateTime.now().difference(start).inHours;
    int nbrOfDaysPassed = (hoursPassed / 24).ceil();
    return nbrOfDaysPassed;
  }

  ///This method checks if the the current time is before or passed the end
  ///of a dare. It will return a true or false answer.
  bool isDareActive() {
    return DateTime.now().isBefore(end);
  }

  @override
  String toString() {
    return 'Dare{start: $start, end: $end, dareConfig: ${dareConfig.getTitle()}, participant1: $participantUser, participant2: $participantOpponent}';
  }
}
