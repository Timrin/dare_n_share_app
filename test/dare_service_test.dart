import 'package:dare_n_share_app/mockdata/db.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/dareService.dart';
import 'package:dare_n_share_app/services/userService.dart';

Future<void> main() async {

  DareService dareService = new DareService();

  Dare dare = dareService.parseDareFromJSON(DB.Dares[1]);
  print(dare);
  Future<String> serverDare = dareService.fetchUsersDares(1);
  print(await serverDare);

}
