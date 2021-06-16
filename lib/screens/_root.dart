import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/screens/home_page.dart';
import 'package:gd_music/screens/library_page.dart';
import 'package:gd_music/screens/music_page.dart';
import 'package:gd_music/screens/search_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final navigationIcons = [
    {"Icons": Foundation.home, "label": "Home"},
    {"Icons": Ionicons.ios_search, "label": "Search"},
    {"Icons": SimpleLineIcons.playlist, "label": "Your Library"},
    {"Icons": Icons.my_library_music, "label": "Musics"},
  ];

  int _currentIndex = 0;
  final double _btNavBarFontSize = 10;
  final boxColor = Colors.grey[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomNavigationBar(),
        body: buildPage());
  }

  Widget bottomNavigationBar() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        fontFamily: fontSpotifyLight,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        iconSize: 25,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: boxColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        selectedFontSize: _btNavBarFontSize,
        unselectedFontSize: _btNavBarFontSize,
        items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                  child: Icon(
                    navigationIcons[index]["Icons"],
                  ),
                ),
                label: navigationIcons[index]["label"])),
      ),
    );
  }

  Widget buildPage() {
    return IndexedStack(
      index: _currentIndex,
      children: [HomePage(), SearchPage(), LibraryPage(), MyMusicPage()],
    );
  }
}
