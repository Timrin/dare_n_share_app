import 'package:dare_n_share_app/models/user.dart';

///Entity class for participants
///A participant belongs to a Dare, and holds user information relating to that dare
class Participant {
  final User user;
  final List score;

  //Constructor
  Participant({this.user, this.score});

  @override
  String toString() {
    return 'Participant{user: $user, score: $score}';
  }
}