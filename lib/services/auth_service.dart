import 'dart:convert';

import 'package:http/http.dart';

import '../config.dart';

///Service class for login and registration
///handles server communication
class AuthService {
  Client client = Client();

  //Temporary helper function
  void parseJSON(String data) {
    Map<String, dynamic> user = jsonDecode(data);
    print("Name: ${user["name"]}");

    for (int i = 0; i < user["friends"].length; i++) {
      print("Friend: $i ${user["friends"][i]["name"]}");
    }
  }

  ///Fetches a user from the server
  ///[userId] is the id of the user in the database
  Future<String> fetchUser(int userId) async {
    //Construct URL
    final url = "http://" + Config.IP + "/user/" + userId.toString();

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
  ///[userAsJson] is a json formatted user that will be sent to the server.
  ///For an example of a valid post request body check look in test->testData folder
  Future<String> registerUser(String userAsJson) async {
    //Construct URL
    final url = "http://" + Config.IP + "/user";

    //Send request
    final response = await client.post(url, body: userAsJson, headers: {'Content-type': 'application/json'});

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
