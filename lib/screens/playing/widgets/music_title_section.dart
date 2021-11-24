import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/song.dart';

class MusicTitleSection extends StatelessWidget {
  const MusicTitleSection({
    Key? key,
    required double padding,
    required this.song,
  })  : _padding = padding,
        super(key: key);

  final double _padding;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(song.title,
                  style: TextStyle(
                      fontFamily: fontSpotify,
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 2,
              ),
              Text(
                song.album.title,
                style: TextStyle(
                    fontFamily: fontSpotify,
                    fontSize: 15,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Icon(
            EvilIcons.heart,
            color: Colors.white,
            size: 32,
          )
        ],
      ),
    );
  }
}
