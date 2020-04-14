import 'package:dare_n_share_app/dares/enums/objective_goals.dart';
import 'package:dare_n_share_app/dares/enums/objective_types.dart';
import 'package:dare_n_share_app/dares/enums/scope_types.dart';
import 'package:dare_n_share_app/dares/i_dare.dart';

class VeganDare implements IDare {
  @override
  getDescription() {
    return "This is a vegan Dare";
    //TODO return instance of
  }

  @override
  getObjectiveGoal() {
    return ObjectiveGoals.vegan;
    //TODO return instance of
  }

  @override
  getObjectiveType() {
    return ObjectiveTypes.yes_no;
    //TODO return instance of
  }

  @override
  getScopeLength() {
    // TODO: implement getScopeLength
    return [{"value": 3, "readable": "3 days"}, {"value": 5, "readable": "5 days"}, {"value": 7, "readable": "7 days"}];
  }

  @override
  getScopeType() {
    // TODO: implement getScopeType
    return ScopeTypes.timed;
  }

  @override
  getTitle() {
    // TODO: implement getTitle
    return "Vegan dare";
  }

}