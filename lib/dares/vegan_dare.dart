import 'package:dare_n_share_app/dares/enums/objective_goals.dart';
import 'package:dare_n_share_app/dares/enums/objective_types.dart';
import 'package:dare_n_share_app/dares/enums/scope_types.dart';
import 'package:dare_n_share_app/dares/i_dare.dart';

class VeganDare implements IDare {
  @override
  getDescription() {
    return "This is a vegan Dare";
  }

  @override
  getObjectiveGoal() {
    return ObjectiveGoals.vegan;
  }

  @override
  getObjectiveType() {
    return ObjectiveTypes.yes_no;
  }

  @override
  getScopeLength() {
    return [{"value": 3, "readable": "3 days"}, {"value": 5, "readable": "5 days"}, {"value": 7, "readable": "7 days"}];
  }

  @override
  getScopeType() {
    return ScopeTypes.timed;
  }

  @override
  getTitle() {
    return "Vegan dare";
  }

}