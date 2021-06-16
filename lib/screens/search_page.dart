import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';
import 'package:gd_music/widgets/genre_section.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: CustomScrollView(slivers: [
            SliverAppBar(
              collapsedHeight: 0,
              toolbarHeight: 0,
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "Search",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.all(9),
                        child: Icon(
                          Ionicons.ios_search,
                          size: 30,
                          color: Colors.black,
                        )),
                    Text(
                      "Artists, songs, or podcasts",
                      style: TextStyle(color: Colors.black87, fontSize: 17),
                    )
                  ]),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Your genre list", style: _style),
                    SizedBox(
                      height: 20,
                    )
                  ]),
            ),
            genreSection(genreList: topCategory, style: _style),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Browse all", style: _style),
                    SizedBox(
                      height: 20,
                    )
                  ]),
            ),
            genreSection(genreList: allCategory, style: _style),
          ]),
        ));
  }
}
