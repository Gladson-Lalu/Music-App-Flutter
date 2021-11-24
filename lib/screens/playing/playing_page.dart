import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/song.dart';
import 'package:gd_music/services/music_player.dart';
import 'widgets/appbar_section.dart';
import 'widgets/image_section.dart';
import 'widgets/music_controller_section.dart';
import 'widgets/music_title_section.dart';
import 'widgets/slider_section.dart';

class PlayingPage extends StatefulWidget {
  final Song song;
  PlayingPage({required this.song});

  @override
  _PlayingPageState createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  bool _isPlaying = false;
  Duration max = Duration(seconds: 0);
  Duration currentPosition = Duration(seconds: 0);
  final MusicPlayer _musicPlayer = MusicPlayer();
  @override
  void initState() {
    _musicPlayer.player.onDurationChanged.listen((duration) {
      if (this.mounted)
        setState(() {
          max = duration;
        });
    });
    _musicPlayer.player.onAudioPositionChanged.listen((duration) {
      if (this.mounted)
        setState(() {
          currentPosition = duration;
        });
    });
    _musicPlayer.player.onPlayerStateChanged.listen((PlayerState state) {
      if (this.mounted)
        setState(() {
          _isPlaying = (state == PlayerState.PLAYING) ? true : false;
        });
    });
    _musicPlayer.play(song: widget.song);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.of(context).size.width - 4 * margin;
    final _padding = 2 * margin + 5;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.song.album.color ?? Colors.black, Colors.black],
                begin: Alignment.topCenter,
                end: FractionalOffset(0.8, 0.9),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBarSection(
                  song: widget.song,
                ),
                SizedBox(
                  height: 40,
                ),
                ImageSection(size: _size, song: widget.song),
                SizedBox(
                  height: 30,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  MusicTitleSection(padding: _padding, song: widget.song),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding - 6),
                    child: BuildSlider(
                      inactiveColor:
                          widget.song.album.color ?? Colors.grey.shade600,
                      duration: max,
                      currentPosition: currentPosition,
                      player: _musicPlayer.player,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                MusicControllerSection(
                    padding: _padding,
                    isPlaying: _isPlaying,
                    song: widget.song,
                    player: _musicPlayer),
              ],
            )),
      ),
    );
  }
}
