import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/album.dart';
import 'package:gd_music/screens/playing/playing_page.dart';
import 'package:page_transition/page_transition.dart';

class MusicListSection extends StatelessWidget {
  const MusicListSection({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(List.generate(
      album.songs!.length,
      (index) => ListTile(
        tileColor: Colors.black,
        title: Text(
          album.songs![index].title,
          style: TextStyle(color: Colors.white, fontFamily: fontSpotify),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: margin),
          child: Text(
            (index + 1).toString(),
            style: TextStyle(color: Colors.white, fontFamily: fontSpotify),
          ),
        ),
        trailing: Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: PlayingPage(
                    song: album.songs![index],
                  ),
                  type: PageTransitionType.bottomToTop));
        },
      ),
    )));
  }
}
