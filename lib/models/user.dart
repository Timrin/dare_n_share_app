class User {
  final String uid;
  final String name;

  User({this.uid, this.name});

  factory User.fromJson(jsonData) {
    String uid = jsonData["name"];
    String name = jsonData["uid"];

    return User(uid: uid, name: name);
  }

  @override
  String toString() {
    return 'User{uid: $uid, name: $name}';
  }
}
