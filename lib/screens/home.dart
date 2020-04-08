import 'package:dare_n_share_app/services/dareService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

///
///This class is the home screen widget for the application
///After login users are directed here
///
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DareService dareService = Provider.of<DareService>(
        context); //TODO Not supposed to be a DareService, this is just for testing

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Dare n Share")),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "home",),
                Tab(icon: Icon(Icons.face), text: "profile",),
              ],
            ),
          ),
          body: TabBarView(children: [
            ListView.builder(
                itemCount: dareService.getDaresOfUser(1).length,
                itemBuilder: (context, index) {
                  return dareTemplate(dareService.getDaresOfUser(1)[index]);
                }),
            Center(child: Text("Profile")),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print("Add Dare pressed, do something"),
            tooltip: 'Add Dare',
            child: Icon(Icons.add),
          )),
    );
  }

  ///
  /// This method takes a dare object and builds a card widget presenting the
  /// information about the dare.
  ///
  Widget dareTemplate(dare) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Column(
            children: <Widget>[
              Text(
                dare.objectiveName,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "You: ${dare.participant1.user.name}",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Score: ${dare.participant1.score}",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Opponent: ${dare.participant2.user.name}",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Score: ${dare.participant2.score}",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "End: ${dare.end.toString()}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[700],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          print('Card taped, do something');
        },
      ),
    );
  }
}
