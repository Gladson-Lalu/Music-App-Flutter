import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';
import 'package:gd_music/screens/SettingsPage.dart';
import 'package:gd_music/widgets/album_section.dart';
import 'package:gd_music/widgets/artist_section.dart';
import 'package:gd_music/widgets/playlist_Section.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final double _sectionalHeight = 30;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            primary: true,
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green[400], Colors.black],
                        begin: Alignment.topLeft,
                        end: FractionalOffset(0.1, 0.2))),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(left: margin, right: margin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(greeting(), style: titleBarTextStyle),
                          IconButton(
                            icon: Icon(
                              SimpleLineIcons.settings,
                              color: Colors.white,
                              size: 22,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    child: SettingsPage(),
                                    alignment: Alignment.topRight,
                                    type: PageTransitionType.fade),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _sectionalHeight,
                  ),
                  buildAlbumSection(context: context, json: songsJson1),
                  SizedBox(
                    height: _sectionalHeight,
                  ),
                  buildAlbumSection(context: context, json: songsJson2),
                  SizedBox(
                    height: _sectionalHeight,
                  ),
                  buildPlaylistSection(json: indianPlaylistJson),
                  SizedBox(
                    height: _sectionalHeight,
                  ),
                  buildArtistSection(json: artistJson),
                  SizedBox(
                    height: _sectionalHeight,
                  ),
                  buildPlaylistSection(json: chartsJson),
                  SizedBox(
                    height: _sectionalHeight,
                  ),
                  buildPlaylistSection(json: podcastsJson),
                  SizedBox(
                    height: 30,
                  ),
                ]))));
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    }
    if (hour < 17) {
      return 'Good afternoon';
    }
    return 'Good evening';
  }
}
