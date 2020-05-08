import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/models/user.dart';
import 'package:dare_n_share_app/screens/select_dare_config_screen.dart';
import 'package:dare_n_share_app/screens/widgets/dare_view_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Dare n Share",
            )),
            backgroundColor: ColorDesign.colorAppbar,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: ColorDesign.colorProfile,
                  ),
                  text: "home",
                ),
                Tab(
                  icon: Icon(
                    Icons.face,
                    color: ColorDesign.colorProfile,
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
                UserAvatar("txVGzDSYztQoQuFlessXlgNtmmw1"),
                UserAvatar("B9izBstBTeOg305FSxklLDx4Ly72"),
                UserAvatar("pUgUV4by6HYWpeRhqLbTG763NWI3"),
                UserAvatar("pf5ft00Dcic5iojgwfc7sMc3miu2"),
                UserAvatar("4"),
                UserAvatar("5"),
                UserAvatar("6"),
                UserAvatar("7"),
                UserAvatar("8"),
                RaisedButton(
                  child: Center(
                    child: Text("Logout"),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            )
          ]),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorDesign.colorHomeButton,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Text(
                "Username", //TODO display actual username
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: UserAvatar(userId),
            )
          ],
        ),
      ),
    );
  }
}
