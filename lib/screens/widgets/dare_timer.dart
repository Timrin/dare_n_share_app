import 'dart:async';

import 'package:flutter/material.dart';

///
class DareTimer extends StatefulWidget {
  final DateTime endTime;

  DareTimer({Key key, @required this.endTime}) : super(key: key);

  @override
  _DareTimerState createState() => _DareTimerState();
}

class _DareTimerState extends State<DareTimer> {
  Timer _timer;

  int _timeLeftMinutes; //Variable for tracking remaining time of a dare
  String _timeLeftString; //The string for the text widget

  @override
  void initState() {
    super.initState();

    print(timeLeftInMinutes());
    _timeLeftMinutes = timeLeftInMinutes();
    _timeLeftString = timeLeftString(_timeLeftMinutes);

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(
        "$_timeLeftString",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  ///Method responsible for updating the state of the widget, and the timeLeft
  /// variables of this class.
  ///
  ///This might not be a perfect timer, if the widget is left running for
  ///long enough it might not accurately represent the time left. However
  ///the error margin is so slight that this should not matter for the use case
  ///Time left is also only accurate down to the minute.
  void startTimer() {
    const oneMin = const Duration(minutes: 1);

    _timer = new Timer.periodic(
      oneMin,
      (Timer timer) => setState(
        () {
          if (_timeLeftMinutes < 1) {
            timer.cancel();
          } else {
            _timeLeftMinutes -= 1;
            _timeLeftString = timeLeftString(_timeLeftMinutes);
          }
        },
      ),
    );
  }

  ///Method for calculating how many minutes are left of the dare
  /// This method is used when starting the timer, to set an initial value.
  int timeLeftInMinutes() {
    return widget.endTime.difference(DateTime.now()).inMinutes;
  }

  ///This method builds the time left string for a dare
  ///
  /// Given the minutes left of the dare, this method produces a string
  /// indicating how much is left of the dare.
  /// If there is more than 1440 minutes(24 hours) left the string is "x days"
  /// If there is more than 0 minutes left the string is "xxh yym" ex: "1h 12m"
  ///
  /// If there is more than -1440 minutes left the string is "overtime"
  /// Otherwise the string is "time's up"
  String timeLeftString(int minutesLeft) {
    Duration timeLeft = Duration(minutes: minutesLeft);
    if (minutesLeft > 1440) {
      //More than 24h left
      //return number of days
      return "${timeLeft.inDays} days";
    } else if (minutesLeft > 0) {
      //More than 1H left
      //return xxH xxM
      return "${timeLeft.inHours}h ${timeLeft.inMinutes.remainder(60)}m";
    } else if (minutesLeft > -1440) {
      //If end was less than 24hours ago, over time is active
      return "Overtime ${timeLeft.inHours*-1}h ${timeLeft.inMinutes.remainder(60)*-1}m";
    } else {
      //Times up
      return "time's up";
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
