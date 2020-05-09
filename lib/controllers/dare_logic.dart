import 'dart:convert';

import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/dare_configurations/enums/objective_goals.dart';
import 'package:dare_n_share_app/dare_configurations/enums/objective_types.dart';
import 'package:dare_n_share_app/dare_configurations/enums/scope_types.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/auth_service.dart';
import 'package:dare_n_share_app/services/dare_service.dart';

///@author Timothy Timrin

class DareLogic {

  //Not sure if this class should be more of a static helper class or
  // if it needs to hold data.
  //For now it will be a singleton class, since there shouldn't be any
  // reason to have multiple instances of the class.

  ///Provide an instance of the class
  static final DareLogic instance = DareLogic._();

  DareLogic._(); //Private constructor

  DareService dareService = DareService();
  Map loadedDares = Map(); //TODO: refactor, remove

  ///Get dares of the logged in user as a map
  /// where the key is the id of the dare, and the value is the dare as a dare object
  Future<List> getDares() async {
    Map<String, Dare> dareMap = Map(); //TODO: refactor, remove
    List dareList = List();

    //Get the uid of the current user
    final String uid = await AuthLogic.instance.currentUserId;
    assert(uid != null);

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
        String id = dareIdList[i];
        try {
          Dare fetchedDare = await dareService.fetchDare(id, uid);

          dareMap[dareIdList[i]] = fetchedDare;
          dareList.add(fetchedDare);
        } catch (e) {
          print(e);
        }
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
  Future<bool> createDare(ObjectiveTypes objectiveType, ObjectiveGoals objectiveGoal,
      ScopeTypes scopeType, int scopeLength, String opponentId) async{
    Map dareMap = Map();

    //Get the uid of the current user
    final String uid = await AuthLogic.instance.currentUserId;
    assert(uid != null);

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
    instigator["uid"] = uid;
    participantsList.add(instigator);

    //Opponent
    var opponent = {};
    opponent["uid"] = opponentId;
    participantsList.add(opponent);

    dareMap["participants"] = participantsList;

    print(jsonEncode(dareMap)); //TODO: remove
    return dareService.postDare(jsonEncode(dareMap));
  }

  ///Report score to the server
  ///Given the appropriate parameters compiles a score request body and sends it to the server
  Future<bool> reportScore(String dareId, ObjectiveTypes scoreType, dynamic scorePoint) async {
    //Get the uid of the current user
    final String uid = await AuthLogic.instance.currentUserId;
    assert(uid != null);

    //Build meta data
    var body = {};
    body["uid"] = uid;
    body["dare_id"] = dareId;

    //Build score object
    var score = {};
    score["type"] = scoreType.toString().split('.').last; //Server needs to know what type of score it is
    score["point"] =
        scorePoint; //TODO: validate that the score is of the correct type

    body["score"] = score; //add score object to the body

    print(jsonEncode(body));
    return dareService.postScore(jsonEncode(body));
  }
}
