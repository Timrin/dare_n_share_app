import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/screens/add_friend.dart';
import 'package:dare_n_share_app/screens/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

///Widget class for a friend list card
///If a user has friends their names and avatars are displayed in a horizontal list.
///If the user does not have any friends added, a short message is shown,
/// encouraging the user to add some friends.
///The card also has an "action button" in the top right corner, which directs
/// the user to the add friend screen.
class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Text(
//              "Friends",
//              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
//            ),
            ListTile(
              title: Text(
                "Friends",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddFriend()));
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: UserLogic.instance.getFriends(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data.length != 0) {
                    return Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          dynamic friend = snapshot.data[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Column(
                              children: <Widget>[
                                UserAvatar(friend["uid"]),
                                Center(
                                  child: Text(friend["name"]),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      height: 80,
                      child: Center(
                          child: Text(
                              "It's dangerous to go alone, add some friends!")),
                    );
                  }
                }
                return Container(
                    height: 80,
                    child: Center(child: CircularProgressIndicator()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
