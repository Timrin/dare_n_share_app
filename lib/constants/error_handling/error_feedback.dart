import 'package:dare_n_share_app/constants/error_handling/error_types.dart';
import 'package:flutter/material.dart';

class ErrorFeedback {
  ErrorFeedback._(); //Private constructor

     static const errorData = <ErrorTypes, dynamic>{
       ErrorTypes.no_connection: {
         "icon":Icons.cloud_off,
         "message": "Could not reach the server",
       },
       ErrorTypes.user_has_no_dares: {
         "icon":Icons.sentiment_dissatisfied,
         "message": "You don't have any dares yet\nPress the + to start one!",
       },
       ErrorTypes.user_has_no_friends: {
         "icon":Icons.group_add,
         "message": "It's more fun with friends!\nLet's add some!",
       },
     };
}
