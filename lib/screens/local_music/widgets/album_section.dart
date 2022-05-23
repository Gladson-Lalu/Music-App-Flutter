import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/album.dart';
import 'package:gd_music/screens/playlist/playlist_page.dart';
import 'package:gd_music/services/fetch_music_file.dart';
import 'package:page_transition/page_transition.dart';

class AlbumSection extends StatefulWidget {
  const AlbumSection({key}) : super(key: key);

  @override
  State<AlbumSection> createState() => _AlbumSectionState();
}

class _AlbumSectionState extends State<AlbumSection> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width / 2.3;
    return FutureBuilder(
        future: FetchMusicFile.albums,
        builder: (_, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.hasData) {
            return Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (MediaQuery
                                              .of(context)
                                          .orientation ==
                                      Orientation.portrait)
                                  ? 2
                                  : 3,
                              crossAxisSpacing: margin,
                              mainAxisSpacing: margin),
                      itemBuilder: (BuildContext context,
                          int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment
                                        .bottomLeft,
                                    child: AlbumSongs(
                                      album: snapshot
                                          .data![index],
                                    ),
                                    type: PageTransitionType
                                        .scale));
                          },
                          child: GridTile(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(
                                        10),
                                child: Image(
                                  image: snapshot
                                      .data![index]
                                      .coverImageProvider,
                                  height: _width,
                                  width: _width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              footer: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 12),
                                child: Text(
                                  snapshot
                                      .data![index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 1,
                                            offset:
                                                Offset.zero)
                                      ],
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.bold),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ]);
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                strokeWidth: 3,
              ),
            );
          }
        });
  }
}
