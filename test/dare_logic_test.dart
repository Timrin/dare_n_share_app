import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/enums/objective_goals.dart';
import 'package:dare_n_share_app/enums/objective_types.dart';
import 'package:dare_n_share_app/enums/scope_types.dart';

Future<void> main() async {

  DareLogic dareLogic = new DareLogic();

  //Test getting a list of a user's dares
  Map dareList = await dareLogic.getDares();

  print(dareList);

  //Test create dare
  dareLogic.createDare(ObjectiveTypes.yes_no, ObjectiveGoals.vegan, ScopeTypes.timed, 3, 2);

  //Test scoring
  dareLogic.reportScore("d1", true);

}