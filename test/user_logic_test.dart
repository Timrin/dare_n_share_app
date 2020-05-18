import 'package:dare_n_share_app/controllers/user_logic.dart';

Future<void> main() async {

  UserLogic userLogic = UserLogic.instance;

  List friendsList = await userLogic.getFriends();

  friendsList.forEach((friend) => print(friend));

}