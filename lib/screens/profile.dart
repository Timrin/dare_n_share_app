import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/screens/widgets/friend_list.dart';
import 'package:dare_n_share_app/screens/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String userId;

  Profile({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12.0),
      children: <Widget>[
        _buildUserInfoCard(context, this.userId),
        FriendList(),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          child: Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.black,
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }

  Widget _buildUserInfoCard(BuildContext context, String userId) {
    return Container(
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                UserAvatar(userId),
                Center(
                  child: FutureBuilder(
                    future: UserLogic.instance.getCurrentUser(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          //Build the dare list
                          return Text(
                            snapshot.data.name,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          );
                        } else {
                          //if there was an error loading the the user, display default username
                          return Text(
                            "user",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          );
                        }
                      } else {
                        //return loading indicator
                        return Text(
                          "",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey[700]),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Center(
                    heightFactor: 1, child: Text("Made with 🍻 &🍷at MAU"))));
          },
        ),
      ),
    );
  }
}
