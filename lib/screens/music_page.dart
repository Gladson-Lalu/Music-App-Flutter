import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';

class MyMusicPage extends StatefulWidget {
  const MyMusicPage({key}) : super(key: key);

  @override
  _MyMusicPageState createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextStyle _style =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600);

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
                SliverAppBar(
                  floating: true,
                  expandedHeight: _height,
                  backgroundColor: Colors.black,
                  toolbarHeight: 0,
                  collapsedHeight: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/img_2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.2, 1],
                        ))),
                      ),
                    ]),
                    centerTitle: true,
                    title: Center(
                      child: Text(
                        "Your Music",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    titlePadding: EdgeInsets.only(top: _height / 2),
                  ),
                  pinned: true,
                  bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.green,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: "Albums",
                        ),
                        Tab(
                          text: "Artist",
                        ),
                        Tab(text: "Tracks"),
                        Tab(text: "Playlists"),
                        Tab(text: "Generes")
                      ]),
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: margin),
                  child: LocalAlbumPage()),
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

class LocalAlbumPage extends StatelessWidget {
  const LocalAlbumPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width / 2.3;
    List songs = songsJson1['songs'] + songsJson2['songs'];
    return Flex(direction: Axis.vertical, children: [
      Expanded(
        child: GridView.count(
            mainAxisSpacing: margin,
            crossAxisSpacing: margin,
            crossAxisCount: 2,
            children: List.generate(songs.length, (index) {
              return GridTile(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      songs[index]['img'],
                      height: _width,
                      width: _width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: Padding(
                    padding: EdgeInsets.only(bottom: 5, left: 12),
                    child: Text(
                      songs[index]['title'],
                      style: TextStyle(
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 1, offset: Offset.zero)],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ));
            })),
      ),
    ]);
  }
}
