import 'dart:convert';

import 'package:dare_n_share_app/models/participant.dart';
import 'package:dare_n_share_app/models/user.dart';

class Dare {
  //TODO: refactor, utilize the dare configuration classes
  //Scope
  final DateTime start;
  final DateTime end;

  //Objective
  final String objectiveType;
  final String objectiveName;

  //Users and score
  final Participant participant1;
  final Participant participant2;

  Dare(
      {this.start,
      this.end,
      this.objectiveName,
      this.objectiveType,
      this.participant1,
      this.participant2});

  factory Dare.fromJson(jsonData) {
    Map<String, dynamic> dare = jsonDecode(jsonData);
    var participants = new List();

    //Read config data
    String objectiveType = dare["objective"]["type"];
    String objectiveName = dare["objective"]["goal"];

    //Create the participant objects
    //TODO: refactor, objectiveType should be an enum type, if case should be a switch case
    for (int i = 0; i < dare["participants"].length; i++) {
      String userName = dare["participants"][i]["name"];
      int uid = dare["participants"][i]["uid"];

      if (objectiveType == "BOOLEAN") {
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
        objectiveName: objectiveName,
        objectiveType: objectiveType,
        participant1: participants[0],
        participant2: participants[1]);
  }

  @override
  String toString() {
    return 'Dare{start: $start, end: $end, objectiveType: $objectiveType, objectiveName: $objectiveName, participant1: $participant1, participant2: $participant2}';
  }
}
