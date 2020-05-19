import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/widgets/add_friend_form.dart';
import 'package:flutter/material.dart';

class AddFriend extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Center(
          child: Text(
        "Dare n Share",
      )),
      backgroundColor: ColorDesign.colorAppbar,
    ),
      body: AddFriendForm(),
    );
  }
}