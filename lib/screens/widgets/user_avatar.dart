import 'package:dare_n_share_app/models/avatar_images.dart';
import 'package:flutter/material.dart';

///@Author Timothy Timrin
/// A user avatar is a container with an avatar image and a background.
/// A user's avatar image and background color is determined by their
/// user id (uid).

class UserAvatar extends StatelessWidget {
  final int uid;

  UserAvatar(this.uid);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Image(
          width: 32,
          height: 32,
          image: AssetImage(getAvatarImage()),
        ),
        color: calcAvatarColor(),
      ),
    );
  }

  //TODO: This is a dumb way to do this, do it better
  ///Calculate the background color of a users avatar
  /// based on their user id
  Color calcAvatarColor() {
    Color calculatedColor;
    int colorId = uid % 11;
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
        calculatedColor = Colors.lightBlueAccent;
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
        calculatedColor = Colors.greenAccent;
        break;
      default:
        calculatedColor = Colors.black45;
        break;
    }
    return calculatedColor;
  }

  ///Get the avatar image path based on a users id
  String getAvatarImage() {
    int imageId = uid % AvatarImages.image.length;

    return AvatarImages.image[imageId];
  }
}
