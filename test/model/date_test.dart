import 'dart:math';

Future<void> main() async {
  DateTime start = DateTime.tryParse("2012-01-23T18:25:43.511Z");
  DateTime end = DateTime.tryParse("2012-01-24T19:25:43.511Z");
  getDayspassed(start, end);
}

int getDayspassed(DateTime start, DateTime end) {
  int value = end.difference(start).inHours;

  print((value / 24).ceil());

  return 1;
}
