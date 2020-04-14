import 'package:dare_n_share_app/dares/enums/objective_goals.dart';
import 'package:dare_n_share_app/dares/enums/objective_types.dart';
import 'package:dare_n_share_app/dares/enums/scope_types.dart';
import 'package:dare_n_share_app/dares/i_dare.dart';

class ExerciseDare implements IDare{
  @override
  getDescription() {
    return "This is an exercise dare";
  }

  @override
  getObjectiveGoal() {
    return ObjectiveGoals.exercise;
  }

  @override
  getObjectiveType() {
    return ObjectiveTypes.count;
  }

  @override
  getScopeLength() {
    return [{"value": 5000, "readable": "5000 steps"}, {"value": 10000, "readable": "10 000 steps"}, {"value": 15000, "readable": "15 000 steps"}];
  }

  @override
  getScopeType() {
    return ScopeTypes.goal;
  }

  @override
  getTitle() {
    return "Exercise dare: Steps";
  }

}