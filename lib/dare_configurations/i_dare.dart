
class IDare {

  ///Should return the ObjectiveTypes enum value indicating the objective type of the dare
  getObjectiveType() {}

  ///Should return the ObjectiveGoals enum value indicating the objective goal of the dare
  getObjectiveGoal() {}

  ///Should return the ScopeTypes enum value indicating the scope type of the dare
  getScopeType() {}

  ///Should return a list with the different scope length options of the dare
  ///
  ///The list objects should be an object containing the value, and a readable string
  ///Example:
  ///[{
  ///   "value": 3,
  ///   "readable": "3 days"},
  /// {
  ///   "value": 5,
  ///   "readable": "5 days"
  ///}]
  getScopeLength() {}

  ///Should return the title of the dare
  ///
  ///The title should be a user friendly name of the dare
  getTitle() {}

  ///Should return the description of the dare
  ///
  ///This description may be visible on the create screen and the dare details screen
  getDescription() {}
}
