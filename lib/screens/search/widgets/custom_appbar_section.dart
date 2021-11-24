import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomAppBarSection extends StatelessWidget {
  const CustomAppBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 0,
      toolbarHeight: 0,
      pinned: true,
      backgroundColor: Colors.black,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Padding(
          padding: EdgeInsets.only(top: 80),
          child: Text(
            "Search",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Row(children: [
            Padding(
                padding: EdgeInsets.all(9),
                child: Icon(
                  Ionicons.ios_search,
                  size: 30,
                  color: Colors.black,
                )),
            Text(
              "Artists, songs, or podcasts",
              style: TextStyle(color: Colors.black87, fontSize: 17),
            )
          ]),
        ),
      ),
    );
  }
}
