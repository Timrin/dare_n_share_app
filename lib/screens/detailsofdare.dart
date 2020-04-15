
import 'package:dare_n_share_app/models/dare.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';






class DetailsOfDare extends StatelessWidget {
  Dare dare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Dare n share")),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 60,),
          Center(child: Text("Vegan challenge"),
          ),
          Center(child: Text("vs"),
          ),
          Center(child: Text("Anders Tegnell"),
          ),
          SizedBox(height: 60,),
          Text("You"),
          SizedBox(height: 20,),
          StepProgressIndicator(
            totalSteps: 5,
            //TODO get real length of challenge,
            currentStep: 3,
            selectedColor: Colors.lightGreen,
            unselectedColor: Colors.grey,
          ),
          SizedBox(height: 30,),
          Text("Anders Tegnell"),
          SizedBox(height: 20,),
          StepProgressIndicator(
            totalSteps: 5,
            currentStep: 3,
            selectedColor: Colors.lightGreen,
            unselectedColor: Colors.grey,
          ),
          SizedBox(height: 100,),
          Center(child: Text("Have you succeded today?"),),
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[boxCheckYes(), boxCheckNo()],)
        ],

      ),
    );

  }

  Widget boxCheckYes() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(child: Text("Yes")),
        ),
        onTap: (){
          //TODO add navigation or right output
        },
      ),
    );
  }


  Widget boxCheckNo() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Center(child: Text("No")),
        ),
        onTap: (){
          //TODO add navigation or right output
        },
      ),
    );
  }

/*
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Details of dare")),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40,),
              Text("Vegan dare"), Text("vs"), Text("Anders Tegnell"),
              //TODO make participants 2 return String
              Text("3 days left"),
              //TODO return days left of challenge
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
     */






}