import 'dart:convert';

import 'package:dare_n_share_app/enums/objective_goals.dart';
import 'package:dare_n_share_app/enums/objective_types.dart';
import 'package:dare_n_share_app/enums/scope_types.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/authService.dart';
import 'package:dare_n_share_app/services/dareService.dart';

class DareLogic {
  int uid = 1; //TODO: Change, temporary hardcoded uid for the logged in user
  DareService dareService = DareService();
  Map loadedDares = Map();

  ///Get dares of the logged in user as a map
  /// where the key is the id of the dare, and the value is the dare as a dare object
  Future<Map<String, Dare>> getDares() async {
    Map<String, Dare> dareMap = Map();

    //Get all dare ids of the active user
    final response = await AuthService().fetchUser(uid);
    final Map userData = jsonDecode(response);

    //Create a list of all the ids
    final List dareIdList = List();
    userData["dares"].forEach((v) => dareIdList.add(v["id"]));

    //Fetch all the dares from the server
    //Build the return map
    for (int i = 0; i < dareIdList.length; i++) {
      int id = int.parse(dareIdList[i].substring(
          1)); //Id in the JSON payload is a number with a leading "d", remove the d and parse to int
      dareMap[dareIdList[i]] = await dareService.fetchDare(id);
    }

    //Set loaded dares to the retrieved dares
    loadedDares = dareMap;

    return dareMap;
  }

  createDare(ObjectiveTypes objectiveType, ObjectiveGoals objectiveGoal,
      ScopeTypes scopeType, int scopeLength, int opponentId) {
    Map dareMap = Map();

    //build the objective map
    var objective = {};
    objective["type"] = objectiveType.toString();
    objective["goal"] = objectiveGoal.toString();
    dareMap["objective"] = objective;

    //build the scope map
    var scope = {};
    scope["type"] = scopeType.toString();
    scope["length"] = scopeLength;
    dareMap["scope"] = scope;

    //build the participants list
    List participantsList = List();
    //Instigator
    var instigator = {};
    instigator["uid"] =
        uid; //TODO: Change, temporary hardcoded uid for the logged in user
    participantsList.add(instigator);

    //Opponent
    var opponent = {};
    opponent["uid"] = opponentId;
    participantsList.add(opponent);

    dareMap["participants"] = participantsList;

    //TODO: Send the dare to the server
    //dareService.postDare(jsonEncode(dareMap));
    print(jsonEncode(dareMap));
  }

  reportScore(String dareId, dynamic scorePoint) {
    //TODO: check if the user should be able to score, should this validation be here?

    //Build meta data
    var body = {};
    body["uid"] = uid;
    body["dare_id"] = dareId;

    //Build score object
    var score = {};
    score["type"] = loadedDares["d1"].objectiveType; //Server needs to know what type of score it is
    score["point"] = scorePoint;

    body["score"] = score; //add score object to the body

    //TODO: Send the score to the server
    //dareService.postScore(jsonEncode(body));
    print(jsonEncode(body));
  }
}
