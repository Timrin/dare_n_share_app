import 'dart:convert';

import 'package:dare_n_share_app/dare_configurations/enums/objective_types.dart';
import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/dare_configurations/vegan_dare.dart';
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
  final Participant participant1;
  final Participant participant2;

  Dare(
      {this.start,
      this.end,
      this.dareConfig,
      this.scopeLength,
      this.participant1,
      this.participant2});

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

    //Create the participant objects
    //TODO: refactor, objectiveType should be an enum type, if case should be a switch case
    for (int i = 0; i < dare["participants"].length; i++) {
      String userName = dare["participants"][i]["name"];
      int uid = dare["participants"][i]["uid"];

      if (dareConfig.getObjectiveType() == ObjectiveTypes.yes_no) {
        List score = dare["participants"][i]["score"];
        participants.add(
            Participant(user: User(uid: uid, name: userName), score: score));
      } else {
        //TODO: Error occurred, abort
        print("Error: parseDareFromJSON, unknown objective type");
      }

      print("Created: ${participants[i].toString()}");
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
      //TODO: Error occurred, abort
      print("Error: parseDareFromJSON, unknown scope type");
    }

    return Dare(
        start: start,
        end: end,
        dareConfig: dareConfig,
        scopeLength: scopeLength,
        participant1: participants[0],
        participant2: participants[1]);
  }

  @override
  String toString() {
    return 'Dare{start: $start, end: $end, dareConfig: ${dareConfig.getTitle()}, participant1: $participant1, participant2: $participant2}';
  }
}
