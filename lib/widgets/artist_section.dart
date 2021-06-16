import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';

Widget buildArtistSection({Map json}) {
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
            children: List.generate(albums.length, (index) {
              return Padding(
                padding: EdgeInsets.only(right: margin),
                child: Column(
                  children: [
                    Container(
                      width: coverWidth,
                      height: coverHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(albums[index]['img']),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                        child: Text(albums[index]["title"],
                            maxLines: 1, style: albumTitleTextStyle)),
                  ],
                ),
              );
            }),
          ),
        ),
      )
    ],
  );
}
