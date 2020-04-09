import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../config.dart';

///Service class for login and registration
///handles server communication
class AuthService {
  Client client = Client();

  void parseJSON(String data) {
    Map<String, dynamic> user = jsonDecode(data);
    print("Name: ${user["name"]}");

    for (int i = 0; i < user["friends"].length; i++) {
      print("Friend: $i ${user["friends"][i]["name"]}");
    }
  }

  ///Fetches a user from the server
  ///[uid] is the id of the user
  Future<String> fetchUser(int uid) async {
    //Construct URL
    final url = "http://" + Config.IP + "/user/" + uid.toString();

    //Send request
    final response = await client.get(url);

    //Check response
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return response.body;
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

  ///Registers a user in the system with a post request.
  ///[user] is a json formatted user that will be send to the server.
  Future<String> registerUser(String user) async {
    //Construct URL
    final url = "http://" + Config.IP + "/user";

    //Send request
    final response = await client
        .post(url, body: user, headers: {'Content-type': 'application/json'});

    //Check response
    if (response.statusCode == 200) {
      //If the request was successful, return response
      return response.body;
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }
}
