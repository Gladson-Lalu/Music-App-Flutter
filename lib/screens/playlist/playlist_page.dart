import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gd_music/assets/common_widgets.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/album.dart';
import 'package:gd_music/screens/playlist/widgets/music_list_section.dart';
import 'package:gd_music/services/fetch_music_file.dart';
import 'package:page_transition/page_transition.dart';

import 'widgets/custom_appbar_section.dart';

class AlbumSongs extends StatelessWidget {
  final Album album;
  final List<Album>? _albumsList;
  final List<Album>? albumsList;
  AlbumSongs({required this.album, this.albumsList = null})
      : _albumsList = albumsList != null ? List.from(albumsList) : null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: FetchMusicFile.getAlbumById(album: album),
          builder: (_, AsyncSnapshot<Album> snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  CustomAppBar(album: snapshot.data!),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  MusicListSection(album: snapshot.data!),
                  if (snapshot.data!.sourceType == SourceType.Online)
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
                  if (snapshot.data!.sourceType == SourceType.Online)
                    buildMoreAlbums(context: context),
                ],
              );
            } else
              return customCircularProgressBar();
          }),
    );
  }

  Widget buildMoreAlbums({required BuildContext context}) {
    _albumsList!.remove(album);
    _albumsList!.shuffle();
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      sliver: SliverGrid.count(
          childAspectRatio: .8,
          mainAxisSpacing: margin,
          crossAxisSpacing: margin,
          crossAxisCount: 2,
          children: List.generate(_albumsList!.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomLeft,
                        child: AlbumSongs(
                            album: _albumsList![index], albumsList: albumsList),
                        type: PageTransitionType.scale));
              },
              child: Column(children: [
                Container(
                  height: coverWidth,
                  width: coverHeight,
                  child: Image(
                    image: _albumsList![index].coverImageProvider,
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
                      _albumsList![index].title,
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
