import 'dart:convert';

import 'package:dare_n_share_app/mockdata/db.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/models/participant.dart';
import 'package:dare_n_share_app/models/user.dart';
import 'package:http/http.dart';

import '../config.dart';

class DareService {
  Client client = Client();

  Future<String> fetchUsersDares(int uid) async {
    //Construct URL
    final path = "http://" + Config.IP + "/dare/" + uid.toString();

    //Send request
    final response = await client.get(path);

    //Check response
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return response.body;
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

  //TODO: This might not belong here but in the Dare class as a constructor instead
  Dare parseDareFromJSON(String jsonData) {
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

    return Dare(start: start,
        end: end,
        objectiveName: objectiveName,
        objectiveType: objectiveType,
        participant1: participants[0],
        participant2: participants[1]);


  }

  //TODO: Remove in the future, this is just for testing
  List<Dare> getDaresOfUser(int uid) {
    List<Dare> dares = new List();
    dares.add(parseDareFromJSON(DB.Dares[0]));
    dares.add(parseDareFromJSON(DB.Dares[1]));
    dares.add(parseDareFromJSON(DB.Dares[0]));
    dares.add(parseDareFromJSON(DB.Dares[1]));
    return dares;
  }
}
