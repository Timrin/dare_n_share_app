import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/dare_configurations/enums/objective_goals.dart';
import 'package:dare_n_share_app/dare_configurations/enums/objective_types.dart';
import 'package:dare_n_share_app/dare_configurations/enums/scope_types.dart';

Future<void> main() async {

  DareLogic dareLogic = new DareLogic();

  //Test getting a list of a user's dares
  List dareList = await dareLogic.getDares();

  print(dareList);

  //Test create dare
  String opponentId = "1";
  dareLogic.createDare(ObjectiveTypes.yes_no, ObjectiveGoals.vegan, ScopeTypes.timed, 3, opponentId);

  //Test scoring
  dareLogic.reportScore("d1", ObjectiveTypes.yes_no, true);

}