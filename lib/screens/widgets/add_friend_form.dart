

import 'package:flutter/material.dart';

class AddFriendForm extends StatefulWidget {
  @override
  _AddFriendFormState createState() => _AddFriendFormState();
}

class _AddFriendFormState extends State<AddFriendForm> {
  final _formKey = GlobalKey<FormState>();

  Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
      r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(('
      r'[a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String _email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[SizedBox(height: 30,),
            enterEmail(),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  //Todo addfriend
                }
              },
              child: Text('Ok- Add friend'),
            )
          ],
        ),
      ),
    );
  }

  Widget enterEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: "Enter friends email"),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (email) {
        if (!_validateEmail(email)) {
          return "Please enter valid email";
        }
        return null;
      },
    );
  }



  bool _validateEmail(String email) {
    RegExp reg = new RegExp(_emailPattern);
    return (!reg.hasMatch(email)) ? false : true;
  }
}
