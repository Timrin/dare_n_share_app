import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/widgets/dare_info_card.dart';
import 'package:flutter/material.dart';

///@Authors Timothy Timrin & Karolina Hammar
///CreateDareForm is the widget class for the dare creation form on the
/// creation screen. This is where a user can configure the settings of
/// a dare, and pick opponent.
class CreateDareForm extends StatefulWidget {
  final IDare dare;
  DareLogic dareLogic =
      DareLogic(); //TODO: this should be created further up the widget tree
  UserLogic userLogic =
      UserLogic(); //TODO: this should be created further up the widget tree

  CreateDareForm({Key key, this.dare}) : super(key: key);

  @override
  _CreateDareFormState createState() => new _CreateDareFormState();
}

class _CreateDareFormState extends State<CreateDareForm> {
  //TODO: validate form
  final _formKey = GlobalKey<FormState>();

  //State variables
  int _selectedFriend;
  int _selectedDareLength;

  //This variable holds the future of the friends list
  //It is initialized in initState(). This way the friend list api call is
  // only done on init and not every time the widgets gets rebuilt
  Future _futureFriendList;

  initState() {
    super.initState();

    _futureFriendList = widget.userLogic.getFriends(); //Load the friends list on init
  }

  ///This is the widget of the class
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            DareInfoCard(dare: widget.dare,),
            SizedBox(
              height: 20,
            ),
            Text('Select length of dare'),
            Column(
              children: scopeLengthRadioList(),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: _futureFriendList,
                builder: (context, snapshot) {
                  //TODO: refactor these if statements
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      //when the data is ready build the dropdown
                      return friendDropdown(snapshot.data);
                    } else {
                      //if there was an error loading the friends list tell the user
                      return Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.red),
                      );
                    }
                  } else {
                    //return loading indicator
                    return CircularProgressIndicator();
                  }
                }),
            SizedBox(
              height: 20,
            ),
            okButton(),
          ],
        ),
      ),
    );
  }

  ///Build the ok button
  ///When pressed it will validate the form and try to create a new dare
  ///if successful the user is returned to the home screen
  Widget okButton() {
    return RaisedButton(
      color: ColorDesign.colorAppbar,
      textColor: Colors.white,
      child: Text(
        'Ok - Start Dare',
      ),
      onPressed: () {
        //TODO validate form before calling createDare
        bool success = widget.dareLogic.createDare(
            widget.dare.getObjectiveType(),
            widget.dare.getObjectiveGoal(),
            widget.dare.getScopeType(),
            _selectedDareLength,
            _selectedFriend);
        if (success) {
          //Navigate to home
          // TODO: This seems like a bad way to do this
          // TODO: Dare list should be re-fetched
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          //Show error message
          final errorSnackBar = SnackBar(
            content: Text("Dare could not be created, try again!"),
          );
          Scaffold.of(context).showSnackBar(errorSnackBar);
        }
      },
    );
  }

  ///Build the drop down list for selecting opponent
  Widget friendDropdown(friendListData) {
    return DropdownButton(
      hint: new Text('Select the friend you want to dare'),
      items: dropdownFriendList(friendListData),
      value: _selectedFriend,
      onChanged: (value) {
        setState(() {
          _selectedFriend = value;
        });
      },
      isExpanded: true,
    );
  }

  ///Create the drop down list entries for the logged in users friends list
  List<DropdownMenuItem<int>> dropdownFriendList(friendListData) {
    List<DropdownMenuItem<int>> friendListDropdownItems = [];

    friendListData.forEach((friend) {
      friendListDropdownItems.add(DropdownMenuItem(
        child: new Text(friend["name"]),
        value: friend["uid"],
      ));
    });

    return friendListDropdownItems;
  }

  ///Build a radiolist for selecting the scope length of the dare
  List<Widget> scopeLengthRadioList() {
    List<Widget> formWidget = new List();

    formWidget.add(new Column(
      children: widget.dare.getScopeLength().map<Widget>((scope) {
        return RadioListTile<int>(
          title: Text(scope["readable"]),
          value: scope["value"],
          groupValue: _selectedDareLength,
          onChanged: (value) {
            setState(() {
              _selectedDareLength = value;
            });
          },
        );
      }).toList(),
    ));
    return formWidget;
  }
}
