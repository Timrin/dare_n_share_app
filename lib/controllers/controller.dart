import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/controllers/user_logic.dart';

class Controller {
  DareLogic dareLogic;
  UserLogic userLogic;
  AuthLogic authLogic;

  String _userId;

  Controller() {
    dareLogic = DareLogic();
    userLogic = UserLogic();
    authLogic = AuthLogic();
  }

  loginUser(String userId) {
    this._userId = userId;
  }

  logoutUser() {
    this._userId = null;
  }

  String get userId => _userId;

}