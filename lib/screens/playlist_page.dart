import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';
import 'package:gd_music/screens/playing_page.dart';
import 'package:page_transition/page_transition.dart';

class AlbumSongs extends StatelessWidget {
  final Map album;
  final List albumsList = songsJson1["songs"] + songsJson2["songs"];

  AlbumSongs({Key key, @required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List songs = album["songs"];
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSilverAppBarDelegate(album,
                MediaQuery.of(context).size.width - 30, kToolbarHeight + 60),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(List.generate(
            songs.length,
            (index) => ListTile(
              tileColor: Colors.black,
              title: Text(
                songs[index]["title"],
                style: TextStyle(color: Colors.white, fontFamily: fontSpotify),
              ),
              leading: Padding(
                padding: EdgeInsets.only(left: margin),
                child: Text(
                  (index + 1).toString(),
                  style:
                      TextStyle(color: Colors.white, fontFamily: fontSpotify),
                ),
              ),
              trailing: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: PlayingPage(
                          songDetails: {
                            "img": album["img"],
                            "albumTitle": album["title"],
                            "title": songs[index]["title"],
                            "color": album["color"],
                            "duration": songs[index]["duration"],
                          },
                        ),
                        type: PageTransitionType.bottomToTop));
              },
            ),
          ))),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "You might also like",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          buildMoreAlbums(context: context),
        ],
      ),
    );
  }

  Widget buildMoreAlbums({@required BuildContext context}) {
    albumsList.remove(album);
    albumsList.shuffle();
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      sliver: SliverGrid.count(
          childAspectRatio: .8,
          mainAxisSpacing: margin,
          crossAxisSpacing: margin,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomLeft,
                        child: AlbumSongs(
                          album: albumsList[index],
                        ),
                        type: PageTransitionType.scale));
              },
              child: Column(children: [
                Container(
                  height: coverWidth,
                  width: coverHeight,
                  child: Image.asset(
                    albumsList[index]['img'],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: coverWidth,
                  child: Center(
                    child: Text(
                      albumsList[index]['title'],
                      style: albumTitleTextStyle,
                    ),
                  ),
                ),
              ]),
            );
          })),
    );
  }
}

class CustomSilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Map _album;
  final double _extendedHeight;
  final double _minHeight;
  double _range;

  CustomSilverAppBarDelegate(this._album, this._extendedHeight, this._minHeight)
      : _range = _extendedHeight - _minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double _opacity = shrinkOffset > _range ? 1 : shrinkOffset / _range;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Icon(MaterialIcons.favorite_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert_outlined), onPressed: () {})
          ],
          title: Opacity(
              opacity: _opacity,
              child: Text(
                _album["title"],
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                _album["img"],
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.xor,
                color: Colors.black.withOpacity(_opacity),
              ),
            ),
            Positioned.fill(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1],
            )))),
          ]),
        ),
        Positioned(
          bottom: -30,
          left: MediaQuery.of(context).size.width / 2 - 79,
          child: Card(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                child: Text(
                  "Shuffle play",
                  style: TextStyle(
                      fontFamily: fontSpotify,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                )),
            color: Color.fromRGBO(40, 193, 96, 1.0),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28))),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _extendedHeight;

  @override
  double get minExtent => _minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
