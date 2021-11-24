import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/song.dart';

enum SourceType { Online, Local }

class Album {
  final String title;
  final String? id;
  final ImageProvider coverImageProvider;
  late List<Song>? songs;
  final String description;
  late Color? color;
  final SourceType sourceType;

  Album(
      {required this.sourceType,
      required this.description,
      required this.title,
      required this.coverImageProvider,
      this.color,
      this.id,
      this.songs});

  factory Album.fromJson(Map<String, dynamic> json) {
    Album t = Album(
      sourceType: SourceType.Online,
      coverImageProvider: AssetImage(json["img"]),
      title: json["title"],
      description: json["description"],
    );
    t.color = Color(int.parse(json["color"], radix: 16));
    t.songs = List<Song>.from(json["songs"].map((x) => Song.fromJson(x, t)));
    return t;
  }
  factory Album.fromStorage(AlbumInfo albumInfo, Uint8List imageArray) => Album(
      sourceType: SourceType.Local,
      description: "",
      title: albumInfo.title,
      coverImageProvider: (imageArray.isNotEmpty
          ? MemoryImage(imageArray)
          : AssetImage(defaultCoverImage)) as ImageProvider,
      id: albumInfo.id);
}
