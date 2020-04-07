class User {
  final int uid;
  final String name;

  User({this.uid, this.name});

  @override
  String toString() {
    return 'User{uid: $uid, name: $name}';
  }
}