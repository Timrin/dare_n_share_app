class User {
  final String uid;
  final String name;

  User({this.uid, this.name});

  @override
  String toString() {
    return 'User{uid: $uid, name: $name}';
  }
}