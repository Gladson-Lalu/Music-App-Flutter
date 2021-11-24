import 'package:gd_music/models/album.dart';

class Song {
  final String title;
  final Album album;
  final String songUrl;
  Song({required this.title, required this.album, required this.songUrl});

  factory Song.fromJson(Map<String, dynamic> _json, Album _alb) =>
      Song(title: _json["title"], songUrl: _json["song_url"], album: _alb);
}
