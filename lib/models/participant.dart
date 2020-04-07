import 'package:dare_n_share_app/models/user.dart';

class Participant {
  final User user;
  final List score;

  Participant({this.user, this.score});

  @override
  String toString() {
    return 'Participant{user: $user, score: $score}';
  }
}