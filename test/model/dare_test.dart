import 'package:dare_n_share_app/models/dare.dart';

import '../test_data/db.dart';

void main() {
  Dare dare1 = Dare.fromJson(DB.dares[0], "1", "1");

  print("Dates: ${dare1.getDateList()}");

  print("Weekdays: ${dare1.getWeekdaysList()}");
}