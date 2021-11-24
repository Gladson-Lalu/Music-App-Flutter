import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//fonts
const fontSpotify = 'Spotify';
const fontSpotifyLight = 'SpotifyLight';

//Home Dimensions
//Heading Title TextStyle
const TextStyle titleBarTextStyle =
    TextStyle(fontWeight: FontWeight.w900, fontSize: 21, color: Colors.white);

//Album Title TextStyle
const TextStyle albumTitleTextStyle =
    TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600);

//Album Description TextStyle
const TextStyle albumDescTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 13,
    fontFamily: fontSpotify,
    fontWeight: FontWeight.w100);

final TextStyle audioTimeStyle = TextStyle(
    fontFamily: fontSpotify,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.grey.shade300);

//Height of Title and Scrollview
const double sectionGaps = 20;

//Gaps between albums
const double albumGaps = 14;

//coverDimensions
const double coverWidth = 160;
const double coverHeight = 160;

//App Dimensions
const double margin = 16;

//TOAST
void toast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green.shade500,
      textColor: Colors.black);
}

String defaultCoverImage = "assets/images/album_icon.jpg";
