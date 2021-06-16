import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/screens/playlist_page.dart';
import 'package:page_transition/page_transition.dart';

Widget buildAlbumSection({BuildContext context, Map json}) {
  List albums = json["songs"];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: EdgeInsets.only(left: margin),
          child: Text(json["title"], style: titleBarTextStyle)),
      SizedBox(
        height: sectionGaps,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: margin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(albums.length, (index) {
              return Padding(
                padding: EdgeInsets.only(right: albumGaps),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomLeft,
                            child: AlbumSongs(
                              album: albums[index],
                            ),
                            type: PageTransitionType.scale));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: coverWidth,
                        height: coverHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(albums[index]['img'])),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        albums[index]["title"],
                        maxLines: 1,
                        style: albumTitleTextStyle
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          albums[index]["description"],
                          maxLines: 2,
                          style: albumDescTextStyle,
                      )
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      )
    ],
  );
}
