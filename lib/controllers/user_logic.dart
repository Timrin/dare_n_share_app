import 'dart:convert';

import 'package:dare_n_share_app/models/user.dart';
import 'package:dare_n_share_app/services/authService.dart';

class UserLogic {
  int uid = 1; //TODO: Change, temporary hardcoded uid for the logged in user

  ///Get the logged in user's friends list as a map
  /// where the key is the uid of that user and the value is the name of the user
  Future<Map<int, String>> getFriends() async {
    Map<int, String> friendMap = Map();

    //Get user from server (user contains the friends list)
    final response = await AuthService().fetchUser(uid);
    final userData = jsonDecode(response);

    //Extract the friends list from the json response
    final List friendsList = userData["friends"];

    //Build a map of the friends list, key - uid, value - User object
    for (int i = 0; i < friendsList.length; i++) {
      int friendUid = friendsList[i]["uid"];
      String friendName = friendsList[i]["name"];
      friendMap[friendUid] = friendName;
    }

    return friendMap;
  }

  ///Method for adding a friend
  ///[identifier] uid or name of the user that will be added, maybe email TODO: determine identifier
  addFriend(String identifier) {
    //TODO Implement
  }

}
