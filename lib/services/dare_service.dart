import 'package:dare_n_share_app/mockdata/db.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:http/http.dart';

import '../config.dart';

///Service class for dares
///handles server communication
class DareService {
  Client client = Client();

  ///Fetches a dare from the server
  ///[dareId] is the id of the dare in the database
  Future<Dare> fetchDare(String dareId, String currentUserId) async {
    //Construct URL
    final url = "http://" + Config.IP + "/dare/" + dareId.toString();

    //Send request
    final response = await client.get(url);

    //Check response TODO: handle more status codes than 200
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return Dare.fromJson(response.body, currentUserId);
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

  ///TODO: determine return type, also TEST ME!
  ///Attempt to post a new dare to the server
  ///[dareAsJson] is a json representation of a post request for a dare, this 
  ///will be the body of the post request. For an example of a valid post request 
  ///body look in test->testData folder
  Future<bool> postDare(String dareAsJson) async {
    //Construct URL
    final url = "http://" + Config.IP + "/dare/";

    //Send request
    final response = await client.post(url, body: dareAsJson, headers: {'Content-type': 'application/json'});

    //Check response TODO: handle more status codes than 200
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return true;
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

  ///Attempt to post a score on a dare to the server
  ///[scoreAsJson] is a json representation of a post request for a score, this
  ///will be the body of the post request. For an example of a valid post request 
  ///body look in test->testData folder
  Future<bool> postScore(String scoreAsJson) async {
    //Construct URL
    final url = "http://" + Config.IP + "/score/";

    //Send request
    final response = await client.post(url, body: scoreAsJson, headers: {'Content-type': 'application/json'});

    //Check response TODO: handle more status codes than 200
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return true;
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }
}
