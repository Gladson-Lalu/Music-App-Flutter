import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight + 10,
      expandedHeight: kToolbarHeight + 15,
      pinned: true,
      backgroundColor: Colors.black,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage("assets/images/img_profile.jpg"),
      ),
      title: Text(
        "Your Library",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Ionicons.ios_search,
              size: 27,
            )),
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.add,
              size: 27,
            ))
      ],
    );
  }
}
