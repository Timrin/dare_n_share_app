import 'enums/objective_goals.dart';
import 'enums/objective_types.dart';
import 'enums/scope_types.dart';
import 'i_dare.dart';

///@Author Karolina Hammar & Timothy Timrin

class VeganDare implements IDare {
  @override
  getDescription() {
    return "Dare a friend to go vegan with you!";
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

  @override
  getSuccessQuestion() {
    return "Did you stay vegan today?";
  }



}