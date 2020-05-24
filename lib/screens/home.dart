import 'package:dare_n_share_app/constants/colors.dart';
import 'package:dare_n_share_app/models/user.dart';
import 'package:dare_n_share_app/screens/select_dare_config_screen.dart';
import 'package:dare_n_share_app/screens/widgets/dare_view_list.dart';
import 'package:dare_n_share_app/screens/widgets/friend_list.dart';
import 'package:dare_n_share_app/screens/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Author Timothy Timrin
///This class is the home screen widget for the application
///After login users are directed here
class Home extends StatelessWidget {
  final String userId;

  Home({Key key, this.userId}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Dare n Share",
              style: TextStyle(
                  color: ColorDesign.colorPrimary, fontFamily: 'Pacifico'),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: "home",
                ),
                Tab(
                  icon: Icon(
                    Icons.face,
                  ),
                  text: "profile",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            DareViewList(),
            //TODO: implement profile page
            //The profile page has temporarily become an avatar showcase page
            ListView(
              padding: EdgeInsets.all(12.0),
              children: <Widget>[
                _buildUserInfoCard(this.userId),
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
            )
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectDare()));
            },
            tooltip: 'Add Dare',
            child: Icon(Icons.add),
          )),
    );
  }

  Widget _buildUserInfoCard(String userId) {
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
                  child: Text(
                    "Username", //TODO display actual username
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Center(heightFactor: 1,child: Text("Made with 🍻 & 🍷 at MAU"))));
          },
        ),
      ),
    );
  }
}
