import 'package:dare_n_share_app/controllers/auth_logic.dart';
import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/controllers/user_logic.dart';


//TODO: remove, this class is most likely not used anymore.
class Controller {

  String _userId;

  Controller();

  loginUser(String userId) {
    this._userId = userId;
  }

  logoutUser() {
    this._userId = null;
  }

  String get userId => _userId;

}