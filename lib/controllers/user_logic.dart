import 'dart:convert';

import 'package:dare_n_share_app/models/user.dart';
import 'package:dare_n_share_app/services/auth_service.dart';
import 'package:dare_n_share_app/services/user_service.dart';

import 'auth_logic.dart';

///@author Timothy Timrin

class UserLogic {

  ///Provide an instance of the class
  static final UserLogic instance = UserLogic._();

  UserService _userService = UserService();

  UserLogic._(); //Private constructor

  ///Get the logged in user's friends list as a map
  /// where the key is the uid of that user and the value is the name of the user
  Future<List> getFriends() async {
    //Get user from server (user contains the friends list)
    try {
      //Get the uid of the current user
      final String uid = await AuthLogic.instance.currentUserId;
      assert(uid != null);

      final response = await AuthService().fetchUser(uid);
      final userData = jsonDecode(response);

      //Extract the friends list from the json response
      final List friendsList = userData["friends"];

      return friendsList;
    } catch (e) {
      throw Exception("Could not load friends");
    }
  }

  Future<User> getCurrentUser() async {
    //Get the uid of the current user
    final String uid = await AuthLogic.instance.currentUserId;
    assert(uid != null);

    final response = await AuthService().fetchUser(uid);
    final userData = jsonDecode(response);

    return User.fromJson(userData);
  }

  ///Method for adding a friend
  Future<bool> addFriend(String friendEmail) async {
    //Get the uid of the current user
    final String uid = await AuthLogic.instance.currentUserId;

    //Build the request body
    var body = {};
    body["senderID"] = uid;
    body["friendEmail"] = friendEmail;

    print(jsonEncode(body));
    return _userService.postFriend(jsonEncode(body));
  }

}
