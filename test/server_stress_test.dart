import 'dart:io';

import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/services/dare_service.dart';

Future<void> main() async {

  DareService dareService = new DareService();

  String dareId = "1";
  String userId = "pUgUV4by6HYWpeRhqLbTG763NWI3";

  for (int i = 0; i < 10000; i++) {
    try {
    Future<Dare> dare = dareService.fetchDare((i%200).toString(), userId);
    print("${await dare} $i");
    }catch (e) {
      print(e);
    }
  }

}
