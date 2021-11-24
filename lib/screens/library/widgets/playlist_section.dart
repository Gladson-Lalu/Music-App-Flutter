import 'package:flutter/material.dart';

class PlaylistSection extends StatelessWidget {
  const PlaylistSection({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List songs;

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 15),
        children: List.generate(songs.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.asset(
                  songs[index]['img'],
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  songs[index]['title'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ]),
          );
        }));
  }
}
