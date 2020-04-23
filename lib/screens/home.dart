import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/screens/select_dare_config_screen.dart';
import 'package:dare_n_share_app/screens/widgets/dare_view_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

///This class is the home screen widget for the application
///After login users are directed here
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DareLogic dareLogic = Provider.of<DareLogic>(
        context); //TODO Not supposed to be a DareLogic, this is just for testing

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Dare n Share")),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "home",
                ),
                Tab(
                  icon: Icon(Icons.face),
                  text: "profile",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            DareViewList(),
            Center(child: Text("Profile")),
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
}
