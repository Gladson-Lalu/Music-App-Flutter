import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';

class PlayingPage extends StatefulWidget {
  final Map songDetails;

  PlayingPage({Key key, this.songDetails}) : super(key: key);

  @override
  _PlayingPageState createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  bool _isPlaying;

  @override
  void initState() {
    _isPlaying = false;
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
                colors: [widget.songDetails['color'], Colors.black],
                begin: Alignment.topCenter,
                end: FractionalOffset(0.8, 0.9),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Column(children: [
                    Text("PLAYING FROM PLAYLIST",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: fontSpotifyLight)),
                    Text(widget.songDetails['albumTitle'],
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
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: _size,
                    height: _size,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Image.asset(
                      widget.songDetails['img'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.songDetails["title"],
                                style: TextStyle(
                                    fontFamily: fontSpotify,
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.songDetails["albumTitle"],
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding - 6),
                    child: _BuildSlider(
                      inactiveColor: widget.songDetails['color'],
                      duration: 230,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                IconTheme(
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
                              Center(
                                child: _isPlaying
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isPlaying = false;
                                          });
                                        },
                                        child: Icon(
                                          MaterialIcons.pause_circle_filled,
                                          size: 75,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isPlaying = true;
                                          });
                                        },
                                        child: Icon(
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
                ),
              ],
            )),
      ),
    );
  }
}

class _BuildSlider extends StatefulWidget {
  final Color inactiveColor;
  final double duration;

  const _BuildSlider(
      {Key key, @required this.inactiveColor, @required this.duration})
      : super(key: key);

  @override
  _BuildSliderState createState() => _BuildSliderState();
}

class _BuildSliderState extends State<_BuildSlider> {
  double _currentPlayTime = 0;
  double _currentProgress = 0;

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
          value: _currentProgress,
          onChanged: (currentProgress) {
            setState(() {
              _currentPlayTime = widget.duration * (currentProgress / 100);
              _currentProgress = currentProgress;
            });
          },
          max: 100,
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
          Text(
            "${(_currentPlayTime / 60).truncate()}:${(_currentPlayTime.truncate() % 60).toString().padLeft(2, '0')}",
            style: TextStyle(
                fontFamily: fontSpotify,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.grey[300]),
          ),
          Text(
            "${(widget.duration / 60).truncate()}:${(widget.duration.truncate() % 60).toString().padLeft(2, '0')}",
            style: TextStyle(
                fontFamily: fontSpotify,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.grey[300]),
          ),
        ]),
      ),
    ]);
  }
}
