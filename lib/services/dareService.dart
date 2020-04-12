import 'dart:convert';

import 'package:dare_n_share_app/mockdata/db.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/models/participant.dart';
import 'package:dare_n_share_app/models/user.dart';
import 'package:http/http.dart';

import '../config.dart';

///Service class for dares
///handles server communication
class DareService {
  Client client = Client();

  ///Fetches a dare from the server
  ///[did] is the id of the dare
  Future<Dare> fetchDare(int did) async {
    //Construct URL
    final url = "http://" + Config.IP + "/dare/" + did.toString();

    //Send request
    final response = await client.get(url);

    //Check response
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return Dare.fromJson(response.body);
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

  //TODO: Remove in the future, this is just for testing
  List<Dare> getDaresOfUser(int uid) {
    List<Dare> dares = new List();
    dares.add(Dare.fromJson(DB.Dares[0]));
    dares.add(Dare.fromJson(DB.Dares[1]));
    dares.add(Dare.fromJson(DB.Dares[0]));
    dares.add(Dare.fromJson(DB.Dares[1]));
    return dares;
  }
}
