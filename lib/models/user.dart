///Entity class describing a user
class User {
  final String uid;
  final String name;
  String email = "";

  //Constructor
  User({this.uid, this.name, this.email});

  //Factory constructor
  //Constructs User objects from json
  factory User.fromJson(jsonData) {
    String uid = jsonData["uid"];
    String name = jsonData["name"];

    //Construct and return the User object
    return User(uid: uid, name: name);
  }

  //Returns the user object as a json formatted String
  //TODO: there are way better ways to convet an object to json
  String toJson() {
    return "{\"uid\": \"$uid\", \"name\": \"$name\", \"email\": \"$email\"}";
  }

  @override
  String toString() {
    return 'User{uid: $uid, name: $name, email: $email}';
  }
}
