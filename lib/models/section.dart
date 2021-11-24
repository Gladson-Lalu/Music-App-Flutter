import 'album.dart';

class Section {
  final String title;
  final List<Album> albumsList;

  Section({required this.title, required this.albumsList});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        title: json["title"],
        albumsList:
            List<Album>.from(json["songs"].map((x) => Album.fromJson(x))),
      );
}
