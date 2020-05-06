import 'package:dare_n_share_app/models/avatar_images.dart';
import 'package:flutter/material.dart';

///@Author Timothy Timrin
/// A user avatar is a container with an avatar image and a background.
/// A user's avatar image and background color is determined by their
/// user id (uid).

class UserAvatar extends StatelessWidget {
  String _uid;

  UserAvatar(String uid) {
    //The uid string has to be 2 characters in order to generate an avatar
    //uid string shorter than 2 is pre-padded with characters
    this._uid = uid.length == 0 ? "??" : uid.length == 1 ? ("$uid$uid") : uid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: calcAvatarColor(), shape: BoxShape.circle),
      width: 50,
      height: 50,
      padding: EdgeInsets.all(8),
      child: Image(
        width: 42,
        height: 42,
        image: AssetImage(getAvatarImage()),
      ),
    );
  }

  //TODO: This is a dumb way to do this, do it better
  ///Calculate the background color of a users avatar
  /// based on their user id
  Color calcAvatarColor() {
    Color calculatedColor;
    int colorId = _uid.codeUnitAt(0) % 11;
    switch (colorId) {
      case 0:
        calculatedColor = Colors.amberAccent;
        break;
      case 1:
        calculatedColor = Colors.purpleAccent;
        break;
      case 2:
        calculatedColor = Colors.pinkAccent;
        break;
      case 3:
        calculatedColor = Colors.blueAccent;
        break;
      case 4:
        calculatedColor = Colors.redAccent;
        break;
      case 5:
        calculatedColor = Colors.tealAccent;
        break;
      case 6:
        calculatedColor = Colors.greenAccent;
        break;
      case 7:
        calculatedColor = Colors.deepOrangeAccent;
        break;
      case 8:
        calculatedColor = Colors.deepPurpleAccent;
        break;
      case 9:
        calculatedColor = Colors.orangeAccent;
        break;
      case 10:
        calculatedColor = Colors.lightBlueAccent;
        break;
      default:
        calculatedColor = Colors.black45;
        break;
    }
    return calculatedColor;
  }

  ///Get the avatar image path based on a users id
  String getAvatarImage() {
    int imageId = _uid.codeUnitAt(1) % AvatarImages.image.length;

    return AvatarImages.image[imageId];
  }
}
