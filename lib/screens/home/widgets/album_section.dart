import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/album.dart';
import 'package:gd_music/models/section.dart';
import 'package:gd_music/screens/playlist/playlist_page.dart';
import 'package:page_transition/page_transition.dart';

class AlbumSection extends StatelessWidget {
  final Section section;

  const AlbumSection({
    required this.section,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: margin),
            child: Text(section.title, style: titleBarTextStyle)),
        SizedBox(
          height: sectionGaps,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: margin),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(section.albumsList.length, (index) {
                Album album = section.albumsList[index];
                return Padding(
                  padding: EdgeInsets.only(right: albumGaps),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomLeft,
                              child: AlbumSongs(
                                album: album,
                                albumsList: section.albumsList,
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
                                image: album.coverImageProvider),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(album.title,
                            maxLines: 1, style: albumTitleTextStyle),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 160,
                            child: Text(
                              album.description,
                              maxLines: 2,
                              style: albumDescTextStyle,
                            ))
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
}
