import 'package:dare_n_share_app/mockdata/db.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/dare_service.dart';

Future<void> main() async {

  DareService dareService = new DareService();

  String dareId = "1";
  String userId = "pUgUV4by6HYWpeRhqLbTG763NWI3";

  Future<Dare> serverDare = dareService.fetchDare(dareId, userId);
  print(await serverDare);

}
