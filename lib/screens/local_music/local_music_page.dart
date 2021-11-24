import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/screens/local_music/widgets/album_section.dart';
import 'package:gd_music/screens/local_music/widgets/custom_appbar_section.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MyMusicPage extends StatefulWidget {
  const MyMusicPage({key}) : super(key: key);

  @override
  _MyMusicPageState createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextStyle _style =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600);
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height / 2.2;
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                CustomAppBarSection(
                    height: _height, tabController: _tabController)
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: margin),
                  child: AlbumSection()),
              Center(
                child: Text(
                  "Artist",
                  style: _style,
                ),
              ),
              Center(
                child: Text(
                  "Tracks",
                  style: _style,
                ),
              ),
              Center(
                child: Text(
                  "Playlists",
                  style: _style,
                ),
              ),
              Center(
                child: Text(
                  "Generes",
                  style: _style,
                ),
              ),
            ])));
  }
}
