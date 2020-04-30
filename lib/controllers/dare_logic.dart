import 'dart:convert';

import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/dare_configurations/enums/objective_goals.dart';
import 'package:dare_n_share_app/dare_configurations/enums/objective_types.dart';
import 'package:dare_n_share_app/dare_configurations/enums/scope_types.dart';
import 'package:dare_n_share_app/models/active_user.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/auth_service.dart';
import 'package:dare_n_share_app/services/dare_service.dart';

class DareLogic {
  String uid = ActiveUser
      .loggedInUserId; //TODO: Change, temporary hardcoded uid for the logged in user
  DareService dareService = DareService();
  Map loadedDares = Map(); //TODO: refactor, remove

  ///Get dares of the logged in user as a map
  /// where the key is the id of the dare, and the value is the dare as a dare object
  Future<List> getDares() async {
    Map<String, Dare> dareMap = Map(); //TODO: refactor, remove
    List dareList = List();

    //Get all dare ids of the active user
    final response = await AuthService().fetchUser(uid);
    final Map userData = jsonDecode(response);

    if (userData.containsKey("dares")) {
      //Create a list of all the dare ids
      final List dareIdList = List();
      userData["dares"].forEach((v) => dareIdList.add(v["id"]));

      //Fetch all the dares from the server
      //Build the return list
      for (int i = 0; i < dareIdList.length; i++) {
        //Id in the JSON payload is a number with a leading "d", remove the d and parse to int
        int id = int.parse(dareIdList[i].substring(1));
        Dare fetchedDare = await dareService.fetchDare(id);

        dareMap[dareIdList[i]] = fetchedDare;
        dareList.add(fetchedDare);
      }

      //Set loaded dares to the retrieved dares
      loadedDares = dareMap; //TODO: refactor, remove
    }

    //return dareMap;
    return dareList;
  }

  ///Create a dare and send it to the server
  ///Take in all the required data to create a new dare as parameters.
  ///Builds the create request payload and sends the request via DareService
  bool createDare(ObjectiveTypes objectiveType, ObjectiveGoals objectiveGoal,
      ScopeTypes scopeType, int scopeLength, int opponentId) {
    Map dareMap = Map();

    //build the objective map
    var objective = {};
    objective["type"] = objectiveType
        .toString()
        .split('.')
        .last; //calling split since enums are prefixed with their class
    objective["goal"] = objectiveGoal.toString().split('.').last;
    dareMap["objective"] = objective;

    //build the scope map
    var scope = {};
    scope["type"] = scopeType.toString().split('.').last;
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
    return true; //Temporary
  }

  ///Report score to the server
  ///Given the appropriate parameters compiles a score request body and sends it to the server
  bool reportScore(String dareId, ObjectiveTypes scoreType, dynamic scorePoint) {
    //TODO: check if the user should be able to score, should this validation be here?

    //Build meta data
    var body = {};
    body["uid"] = uid;
    body["dare_id"] = dareId;

    //Build score object
    var score = {};
    score["type"] = scoreType; //Server needs to know what type of score it is
    score["point"] =
        scorePoint; //TODO: validate that the score is of the correct type

    body["score"] = score; //add score object to the body

    //TODO: Send the score to the server
    //dareService.postScore(jsonEncode(body));
    print(jsonEncode(body));
    return true;
  }
}
