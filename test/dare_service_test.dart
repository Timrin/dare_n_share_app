import 'package:dare_n_share_app/mockdata/db.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/dare_service.dart';

Future<void> main() async {

  DareService dareService = new DareService();

  Dare dare = Dare.fromJson(DB.dares[1]);
  print(dare);
  Future<Dare> serverDare = dareService.fetchDare("1");
  print(await serverDare);

}
