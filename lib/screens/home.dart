import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//This class is the home screen widget for the application
//After login users are directed here
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dare n Share"),
      ),
    );
  }

}