///Authors Timothy Timrin & Karolina Hammar

///An interface that should be implemented by all dare configuration classes
///The interface details the method api the configuration classes should have.
class IDare {

  ///Returns the ObjectiveTypes enum value indicating the objective type
  /// of the dare
  getObjectiveType() {}

  ///Returns the ObjectiveGoals enum value indicating the objective goal
  /// of the dare
  getObjectiveGoal() {}

  ///Returns the ScopeTypes enum value indicating the scope type of the dare
  getScopeType() {}

  ///Returns a list with the different scope length options of the dare
  ///
  ///The list objects should be a map containing the keys value, and readable
  ///value should hold the int value of the length option, and readable
  ///should hold a readable string of the option that may be displayed
  ///in a gui.
  ///Example:
  ///[{
  ///   "value": 3,
  ///   "readable": "3 days"},
  /// {
  ///   "value": 5,
  ///   "readable": "5 days"
  ///}]
  getScopeLength() {}

  ///Returns the title of the dare
  ///
  ///The title should be a user friendly name of the dare
  getTitle() {}

  ///Returns the description of the dare
  ///
  ///This description may be visible on the create screen and the dare
  /// details screen
  getDescription() {}
}
