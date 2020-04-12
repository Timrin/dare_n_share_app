import 'package:dare_n_share_app/controllers/user_logic.dart';

Future<void> main() async {

  UserLogic userLogic = new UserLogic();

  Map friendsList = await userLogic.getFriends();

  friendsList.forEach((k, v) => print("${k}:${v}"));

}