import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/screens/_root.dart';

void main() {
  runApp(MaterialApp(
    home: RootApp(),
    theme: ThemeData(
      fontFamily: fontSpotify,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
    ),
  ));
}
