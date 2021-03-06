import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/constants/error_handling/error_feedback.dart';
import 'package:dare_n_share_app/constants/error_handling/error_types.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:dare_n_share_app/screens/dare_details_screen.dart';
import 'package:dare_n_share_app/screens/widgets/dare_timer.dart';
import 'package:dare_n_share_app/screens/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

///@Author Timothy Timrin
///DareViewList is the list of card widgets of the user's dares.
/// The list is displayed on the home screen.
class DareViewList extends StatefulWidget {
  DareLogic dareLogic = DareLogic.instance;
  UserLogic userLogic = UserLogic.instance;

  @override
  _DareViewListState createState() => _DareViewListState();
}

class _DareViewListState extends State<DareViewList> {
  //Future holder
  Future _futureDareList;

  initState() {
    super.initState();

    //Load the friends list on init
    _futureDareList = widget.dareLogic.getDares();
  }

  ///Build the DareViewList widget
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder(
        future: _futureDareList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //If the user does not have any dares, display message
              if (snapshot.data.length == 0) {
                return errorFeedbackPage(ErrorTypes.user_has_no_dares);
              }
              //Build the dare list
              return ListView(
                children: snapshot.data.map<Widget>((dare) {
                  return dareTemplate(dare, context);
                }).toList(),
              );
            } else {
              //if there was an error loading the the dares, tell the user
              return errorFeedbackPage(ErrorTypes.no_connection);
            }
          } else {
            //return loading indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      onRefresh: () {
        //When the user refreshes the page the user's dares are fetched from the server again
        setState(() {
          _futureDareList = widget.dareLogic.getDares();
        });
        return _futureDareList;
      },
    );
  }

  /// This method takes a dare object and builds a card widget presenting
  /// basic information about that dare, for example score, time left, participants.
  /// The card is meant to be a quick and simple overview of the dare.
  /// TODO: restructure widgets. style!
  Widget dareTemplate(Dare dare, BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Column(
            children: <Widget>[
              Text(
                dare.dareConfig.getTitle(),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      UserAvatar(dare.participantUser.user.uid),
                      Text(
                        "You",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Score: ${dare.participantUser.score.map((score) => score ? "😎" : "🙈").join(" ")}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      UserAvatar(dare.participantOpponent.user.uid),
                      Text(
                        "${dare.participantOpponent.user.name}",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Score: ${dare.participantOpponent.score.map((score) => score ? "😎" : "🙈").join(" ")}",
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
                "Timeleft",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[700],
                ),
              ),
              DareTimer(
                endTime: dare.end,
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DareDetails(dare: dare)));
        },
      ),
    );
  }

  Widget errorFeedbackPage(ErrorTypes errorType) {
    //Determine type of feedback
    IconData feedBackIcon = ErrorFeedback.errorData[errorType]["icon"];
    String feedBackMessage = ErrorFeedback.errorData[errorType]["message"];

    //Build and return the widget
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Icon(
              feedBackIcon,
              color: Colors.grey,
              size: 48,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: Text(
              feedBackMessage,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
