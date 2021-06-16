import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
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
                SliverAppBar(
                  toolbarHeight: kToolbarHeight,
                  collapsedHeight: kToolbarHeight + 10,
                  expandedHeight: kToolbarHeight + 15,
                  pinned: true,
                  backgroundColor: Colors.black,
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/images/img_profile.jpg"),
                  ),
                  title: Text(
                    "Your Library",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Ionicons.ios_search,
                          size: 27,
                        )),
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add,
                          size: 27,
                        ))
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      height: 40,
                      child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.grey[200],
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          controller: _tabController,
                          tabs: List.generate(
                            tabs.length,
                            (index) => Tab(
                              child: Text(
                                tabs[index],
                              ),
                            ),
                          )),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              playlistSection(),
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

  Widget playlistSection() {
    return Flex(direction: Axis.vertical, children: [
      Expanded(
        child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 15),
            children: List.generate(songs.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.asset(
                      songs[index]['img'],
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      songs[index]['title'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
              );
            })),
      ),
    ]);
  }
}
