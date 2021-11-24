import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';
import 'package:gd_music/screens/library/widgets/appbar_section.dart';
import 'package:gd_music/screens/library/widgets/playlist_section.dart';
import 'package:gd_music/screens/library/widgets/tab_section.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["Playlists", "Artists", "Albums"];
  List songs = songsJson1['songs'] + songsJson2['songs'];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                AppBarSection(),
                TabSection(tabController: _tabController, tabs: tabs)
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              PlaylistSection(songs: songs),
              Center(
                child: Text(
                  "Artist",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  "Albums",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          ),
        ));
  }
}
