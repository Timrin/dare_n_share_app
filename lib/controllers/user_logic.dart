import 'dart:convert';

import 'package:dare_n_share_app/models/active_user.dart';
import 'package:dare_n_share_app/services/auth_service.dart';

///@author Timothy Timrin

class UserLogic {
  String uid = ActiveUser.loggedInUserId; //TODO: Change, temporary hardcoded uid for the logged in user

  ///Get the logged in user's friends list as a map
  /// where the key is the uid of that user and the value is the name of the user
  Future<List> getFriends() async {
    //Get user from server (user contains the friends list)
    try {
      final response = await AuthService().fetchUser(uid);
      final userData = jsonDecode(response);

      //Extract the friends list from the json response
      final List friendsList = userData["friends"];

      return friendsList;
    } catch (e) {
      throw Exception("Could not load friends");
    }
  }

  ///Method for adding a friend
  ///[identifier] uid or name of the user that will be added, maybe email TODO: determine identifier
  addFriend(String identifier) {
    //TODO Implement
  }
}
