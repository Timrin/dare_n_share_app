import 'enums/objective_goals.dart';
import 'enums/objective_types.dart';
import 'enums/scope_types.dart';
import 'i_dare.dart';

///@Author Karolina Hammar & Timothy Timrin

class WorkoutDare implements IDare {
  @override
  getDescription() {
    return "Dare a friend to workout regularly for a couple of days!";
  }

  @override
  getObjectiveGoal() {
    return ObjectiveGoals.workout;
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
    return "Workout dare";
  }

  @override
  getSuccessQuestion() {
    return "Did you workout today?";
  }



}