import 'package:flutter/cupertino.dart';
import 'package:dare_n_share_app/models/dare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SetUpDare extends StatelessWidget{
  Dare dare;
  //Builds the backscreen and the screen itself as a hole
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dare n Share"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column (
          children: <Widget>[SizedBox(height: 20,)
            ,dontEatMeat(), SizedBox(height: 60,),
            Text('Select length of dare'),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Row starts
            children: <Widget>[boxSelectDays1(), boxSelectDays2(), boxSelectDays3()
             ],),
            SizedBox (height: 60,),
            writeFriendToChallenge(),
            SizedBox(height: 60,), buttonOkDare()],
        ),
      ),
    );
  }

  //The widget/ card that display the objective dare option selected.
  Widget dontEatMeat(){ //Ca
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text('Dont eat meat', //Could insert typeOfdare instead, so that this could be reused
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
      ),
    );
  }

  //A widget that displays a number to select length of dare

  Widget boxSelectDays1() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text('3 days',
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
      ),
    );
  }


  Widget boxSelectDays2(){
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text('5 days',
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
      ),
    );
  }

  Widget boxSelectDays3(){
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text('7 days',
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
      ),
    );
  }

  Widget writeFriendToChallenge(){
    return Card(
      margin: EdgeInsets.all(10.00),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0,6,0,6),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Write friends name'),
          ),
        ),
      ) ,
    );
  }

  Widget buttonOkDare() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Text('Ok - Start Dare',
            style: TextStyle(fontSize: 12,
                color: Colors.grey[700]),),
        ),
      ),
    );
  }







}