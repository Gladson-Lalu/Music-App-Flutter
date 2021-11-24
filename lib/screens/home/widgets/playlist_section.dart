import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';

class PlaylistSection extends StatelessWidget {
  final Map json;

  const PlaylistSection({
    required this.json,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: coverWidth,
                        height: coverHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(albums[index]['img']),
                              fit: BoxFit.cover),
                        ),
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
                          ))
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
}
