import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gd_music/assets/songs_json.dart';

Widget genreSection({
  List genreList,
  TextStyle style,
}) {
  TextStyle _style =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);
  return SliverGrid.count(
    crossAxisCount: 2,
    childAspectRatio: 2.3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    children: List.generate(
      genreList.length,
      (index) {
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: colors[index], borderRadius: BorderRadius.circular(5)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 9),
              child: Text(
                genreList[index],
                style: _style,
              )),
        );
      },
    ),
  );
}
