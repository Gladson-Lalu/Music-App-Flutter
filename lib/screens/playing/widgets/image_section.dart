import 'package:flutter/material.dart';
import 'package:gd_music/models/song.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    Key? key,
    required double size,
    required this.song,
  })  : _size = size,
        super(key: key);

  final double _size;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _size,
        height: _size,
        clipBehavior: Clip.hardEdge,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Image(
          image: song.album.coverImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
