import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';

class BuildSlider extends StatefulWidget {
  final Color inactiveColor;
  final Duration duration;
  final Duration currentPosition;
  final AudioPlayer player;

  const BuildSlider(
      {required this.inactiveColor,
      required this.duration,
      required this.currentPosition,
      required this.player});

  @override
  _BuildSliderState createState() => _BuildSliderState();
}

class _BuildSliderState extends State<BuildSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SliderTheme(
        data: SliderThemeData(
            activeTrackColor: Colors.white,
            thumbColor: Colors.white,
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 5,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 8),
            overlayColor: Colors.white),
        child: Slider(
          value: widget.currentPosition.inSeconds.toDouble(),
          onChanged: (currentProgress) {
            setState(() {
              widget.player.seek(Duration(seconds: currentProgress.toInt()));
            });
          },
          max: widget.duration.inSeconds.toDouble(),
          min: 0,
          inactiveColor: (widget.inactiveColor).withOpacity(0.25),
        ),
      ),
      SizedBox(
        height: 7,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.currentPosition.toString().split(".")[0],
              style: audioTimeStyle),
          Text(widget.duration.toString().split(".")[0], style: audioTimeStyle)
        ]),
      ),
    ]);
  }
}
