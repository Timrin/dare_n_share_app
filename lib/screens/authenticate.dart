import 'package:flutter/material.dart';
/**
 * @authors Timothy Timrin & Karolina Hammar
 */

///
///This class is the screen widget for login and registration
///
class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dare n Share"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[SizedBox(height: 200,), loginWidget(), registerWidget()
        ],
      ),
    );
  }

  Widget loginWidget() {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text('Login',
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Center(
            child: Text('Register', style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
          ),
        ),
      ),
    );
  }
}



