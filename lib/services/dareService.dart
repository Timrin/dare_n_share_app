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

  ///TODO: determine return type, TEST ME!
  ///Attempt to post a new dare to the server
  ///[dareAsJson] a json representation of a post request for a dare, this will
  /// be the body of the post request.
  Future<bool> postDare(String dareAsJson) async {
    //Construct URL
    final url = "http://" + Config.IP + "/dare/";

    //Send request
    final response = await client.post(url, body: dareAsJson);

    //Check response TODO: handle more status codes than 200
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return true;
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

  Future<bool> postScore(String scoreAsJson) async {
    //Construct URL
    final url = "http://" + Config.IP + "/score/";

    //Send request
    final response = await client.post(url, body: scoreAsJson);

    //Check response TODO: handle more status codes than 200
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return true;
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
    print("=================================");
    return dares;
  }
}
