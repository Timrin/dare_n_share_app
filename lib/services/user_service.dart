import 'package:http/http.dart';

import '../constants/config.dart';

class UserService {
  Client client = Client();

  Future<bool> postFriend(String friendRequestJson) async {
    //Construct URL
    final url = "http://" + Config.IP + "/friend/";

    //Send request
    final response = await client.post(url, body: friendRequestJson, headers: {'Content-type': 'application/json'});

    //Check response TODO: handle more status codes than 200
    if (response.statusCode == 201) {
      //If the request was successful, return response
      return true;
    } else if (response.statusCode == 404) {
      //404 is the code for when a user with the provided email does not exist
      throw Exception("User doesn't exist");
    } else if (response.statusCode == 409) {
      //409 is the code for when the friend already exists
      throw Exception("Already a friend");
    } else {
      //If the request was not successful, generate exception
      throw Exception("Could not reach the server");
    }
  }

}
