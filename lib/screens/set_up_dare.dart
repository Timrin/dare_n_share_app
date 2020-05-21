import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/widgets/create_dare_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SetUpDare extends StatelessWidget {
  final IDare dare;

  SetUpDare({Key key, this.dare}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create the Dare"),
        centerTitle: true,
        backgroundColor: ColorDesign.colorPrimary,
      ),
      body: Center(
        child: CreateDareForm(dare: dare),
      ),
      );
  }
}
