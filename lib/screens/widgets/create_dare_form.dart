import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/controllers/user_logic.dart';
import 'package:dare_n_share_app/dares/i_dare.dart';
import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();

  int _selectedFriend;
  int _selectedDareLength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          formHeader(),
          SizedBox(
            height: 20,
          ),
          Text('Select length of dare'),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: scopeLengthRadioList(),
          ),
          SizedBox(
            height: 20,
          ),
          friendDropdown(),
          SizedBox(
            height: 20,
          ),
          okButton(),
        ],
      ), //Form widgets goes here
    );
  }

  ///Build a header for the form
  ///Presents information about the dare in a type of header of the form
  ///Information such as title and description of the dare
  Widget formHeader() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Text(
            widget.dare.getTitle(),
            //Could insert typeOfdare instead, so that this could be reused
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
        onTap: () {
          // TODO add navigation
        },
      ),
    );
  }

  ///Build the ok button
  ///When pressed it will validate the form and try to create a new dare
  ///if successful the user is returned to the home screen
  Widget okButton() {
    return RaisedButton(
      color: Colors.teal,
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
  Widget friendDropdown() {
    return DropdownButton(
      hint: new Text('Select Friend'),
      items: dropdownFriendList(),
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
  List<DropdownMenuItem<int>> dropdownFriendList() {
    List<DropdownMenuItem<int>> friendListDropdownItems = [];

    friendListDropdownItems.add(new DropdownMenuItem(
      child: new Text('Tor'),
      value: 3,
    ));
    friendListDropdownItems.add(new DropdownMenuItem(
      child: new Text('Tim'),
      value: 1,
    ));
    return friendListDropdownItems;
  }

  ///Build a radiolist for selecting the scope length of the dare
  List<Widget> scopeLengthRadioList() {
    List<Widget> formWidget = new List();

    formWidget.add(new Column(
      children:
        widget.dare.getScopeLength().map<Widget>((scope) {
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
