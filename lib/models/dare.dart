import 'package:dare_n_share_app/models/participant.dart';

class Dare {
  //Scope
  final DateTime start;
  final DateTime end;

  //Objective
  final String objectiveType;
  final String objectiveName;

  //Users and score
  final Participant participant1;
  final Participant participant2;

  Dare({this.start, this.end, this.objectiveName, this.objectiveType, this.participant1, this.participant2});

  @override
  String toString() {
    return 'Dare{start: $start, end: $end, objectiveType: $objectiveType, objectiveName: $objectiveName, participant1: $participant1, participant2: $participant2}';
  }
}
