///Entity class describing a user
class User {
  final String uid;
  final String name;

  //Constructor
  User({this.uid, this.name});

  //Factory constructor
  //Constructs User objects from json
  factory User.fromJson(jsonData) {
    String uid = jsonData["name"];
    String name = jsonData["uid"];

    //Construct and return the User object
    return User(uid: uid, name: name);
  }

  @override
  String toString() {
    return 'User{uid: $uid, name: $name}';
  }
}
