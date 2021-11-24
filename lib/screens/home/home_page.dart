import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_music/assets/common_widgets.dart';
import 'package:gd_music/assets/songs_json.dart';
import 'package:gd_music/models/section.dart';
import 'package:gd_music/screens/home/widgets/album_section.dart';
import 'package:gd_music/screens/home/widgets/artist_section.dart';
import 'package:gd_music/screens/home/widgets/playlist_Section.dart';
import 'package:gd_music/screens/home/widgets/greetings_section.dart';
import 'package:gd_music/services/network.dart';

class HomePage extends StatelessWidget {
  final double _sectionalHeight = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: NetworkMusic().albumSections,
            builder:
                (BuildContext context, AsyncSnapshot<List<Section>> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                    primary: true,
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.green.shade400, Colors.black],
                                begin: Alignment.topLeft,
                                end: FractionalOffset(0.1, 0.2))),
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          GreetingsSection(),
                          SizedBox(
                            height: _sectionalHeight,
                          ),
                          AlbumSection(section: snapshot.data![0]),
                          SizedBox(
                            height: _sectionalHeight,
                          ),
                          AlbumSection(section: snapshot.data![1]),
                          SizedBox(
                            height: _sectionalHeight,
                          ),
                          PlaylistSection(json: indianPlaylistJson),
                          SizedBox(
                            height: _sectionalHeight,
                          ),
                          ArtistSection(json: artistJson),
                          SizedBox(
                            height: _sectionalHeight,
                          ),
                          PlaylistSection(json: chartsJson),
                          SizedBox(
                            height: _sectionalHeight,
                          ),
                          PlaylistSection(json: podcastsJson),
                          SizedBox(
                            height: 30,
                          ),
                        ])));
              } else
                return customCircularProgressBar();
            }));
  }
}
