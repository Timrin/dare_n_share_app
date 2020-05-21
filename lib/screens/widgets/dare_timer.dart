import 'dart:async';

import 'package:flutter/material.dart';

class DareTimer extends StatefulWidget {
  final DateTime endTime;

  DareTimer({Key key, @required this.endTime}) : super(key: key);

  @override
  _DareTimerState createState() => _DareTimerState();
}

class _DareTimerState extends State<DareTimer> {
  Timer _timer;
  int _start;

  int _timeLeftMinutes;
  String _timeLeftString;

  @override
  void initState() {
    super.initState();

    _start = 10;
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

  void startTimer() {
    const oneMin = const Duration(minutes: 1);

    _timer = new Timer.periodic(
      oneMin,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
            _timeLeftMinutes -= 1;
            _timeLeftString = timeLeftString(_timeLeftMinutes);
          }
        },
      ),
    );
  }

  int timeLeftInMinutes() {
    return widget.endTime.difference(DateTime.now()).inMinutes;
  }

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
