import 'package:dare_n_share_app/controllers/dare_logic.dart';

Future<void> main() async {

  DareLogic dareLogic = new DareLogic();

  Map dareList = await dareLogic.getDares();

  print(dareList);

}