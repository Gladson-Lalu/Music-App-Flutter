import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/assets/songs_json.dart';
import 'package:gd_music/screens/search/widgets/genre_section.dart';

import 'widgets/custom_appbar_section.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: CustomScrollView(slivers: [
            CustomAppBarSection(),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Your genre list", style: _style),
                    SizedBox(
                      height: 20,
                    )
                  ]),
            ),
            genreSection(genreList: topCategory, style: _style),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Browse all", style: _style),
                    SizedBox(
                      height: 20,
                    )
                  ]),
            ),
            genreSection(genreList: allCategory, style: _style),
          ]),
        ));
  }
}
