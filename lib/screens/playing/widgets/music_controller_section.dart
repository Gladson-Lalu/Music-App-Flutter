import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/models/album.dart';
import 'package:gd_music/models/song.dart';
import 'package:gd_music/services/music_player.dart';

class MusicControllerSection extends StatelessWidget {
  const MusicControllerSection({
    Key? key,
    required double padding,
    required bool isPlaying,
    required this.song,
    required this.player,
  })  : _padding = padding,
        _isPlaying = isPlaying,
        super(key: key);

  final double _padding;
  final bool _isPlaying;
  final Song song;
  final MusicPlayer player;
  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Entypo.shuffle,
              size: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.skip_previous_sharp,
                    size: 44,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _isPlaying
                          ? player.pause()
                          : player.play(
                              song: song,
                              isLocal:
                                  song.album.sourceType == SourceType.Local);
                    },
                    child: Center(
                      child: _isPlaying
                          ? Icon(
                              MaterialIcons.pause_circle_filled,
                              size: 75,
                            )
                          : Icon(
                              MaterialIcons.play_circle_filled,
                              size: 75,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.skip_next_sharp,
                    size: 44,
                  ),
                ],
              ),
            ),
            Icon(
              Feather.repeat,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
