import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/screens/settings/settings_page.dart';
import 'package:page_transition/page_transition.dart';

class GreetingsSection extends StatelessWidget {
  const GreetingsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: margin, right: margin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(this.greeting(), style: titleBarTextStyle),
            IconButton(
              icon: Icon(
                SimpleLineIcons.settings,
                color: Colors.white,
                size: 22,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: SettingsPage(),
                      alignment: Alignment.topRight,
                      type: PageTransitionType.fade),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    }
    if (hour < 17) {
      return 'Good afternoon';
    }
    return 'Good evening';
  }
}
