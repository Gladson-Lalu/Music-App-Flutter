import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/song.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({Key? key, required this.song}) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Column(children: [
        Text("PLAYING FROM PLAYLIST",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                fontFamily: fontSpotifyLight)),
        Text(song.album.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: fontSpotify,
                fontSize: 15))
      ]),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(
              Icons.more_vert_outlined,
            ),
            onPressed: () {})
      ],
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 30,
        ),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
