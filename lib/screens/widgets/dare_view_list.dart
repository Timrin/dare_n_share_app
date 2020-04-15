import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/screens/detailsofdare.dart';
import 'package:flutter/material.dart';

class DareViewList extends StatefulWidget {
  DareLogic dareLogic =
      DareLogic(); //TODO: this should be created further up the widget tree
  UserLogic userLogic =
      UserLogic(); //TODO: this should be created further up the widget tree

  @override
  _DareViewListState createState() => _DareViewListState();
}

class _DareViewListState extends State<DareViewList> {
  //Future holder
  Future _futureDareList;

  initState() {
    super.initState();

    _futureDareList = widget.dareLogic.getDares(); //Load the friends list on init
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder(
        //FIXME: This doesn't really work when there is an exception(No internet).
        future: _futureDareList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //Build the dare list
              return ListView(
                children: snapshot.data.map<Widget>((dare) {
                  return dareTemplate(dare, context);
                }).toList(),
              );
            } else {
              //if there was an error loading the the dares, tell the user
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.signal_wifi_off,
                      color: Colors.grey,
                      size: 48,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      child: Text(
                        "${snapshot.error.toString()}",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            //return loading indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      onRefresh: () {
        //When the user refreshes the page the user's dares are fetched from the server again
        _futureDareList =  widget.dareLogic.getDares();
        return _futureDareList;
      },
    );
  }

  /// This method takes a dare object and builds a card widget presenting the
  /// information about the dare.
  Widget dareTemplate(dare, context) {
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailsOfDare()));
        },
      ),
    );
  }
}
