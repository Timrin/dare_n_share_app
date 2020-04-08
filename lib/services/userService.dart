import 'dart:convert';
import 'package:http/http.dart' as http;


class UserService {
  void parseJSON(String data) {
    Map<String, dynamic> user = jsonDecode(data);
    print("Name: ${user["name"]}");

    for (int i = 0; i < user["friends"].length; i++) {
      print("Friend: $i ${user["friends"][i]["name"]}");
    }

  }

  Future<String> getUser(int id) async {
    var response; //fetch user from server
    response = """{
      "uid": 1,
      "name": "Timothy",
      "profile_img": "/profile-picture/1",
      "dares": [
        {
          "id": "d1"
        },
        {
          "id": "d2"
        },
        {
          "id": "d3"
        }
      ],
      "friends": [
        {
          "uid": 2,
          "name": "Steven",
          "profile_img": "/profile-picture/2"
        },
        {
          "uid": 3,
          "name": "Tor",
          "profile_img": "/profile-picture/2"
        }
      ]
    }""";
  }



}
