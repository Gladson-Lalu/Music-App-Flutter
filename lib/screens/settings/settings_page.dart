import 'package:flutter/material.dart';
import 'package:gd_music/assets/constants.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.white),
        leading: IconButton(
          splashColor: Theme.of(context).shadowColor,
          highlightColor: Theme.of(context).shadowColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            SizedBox(height: 20),
            buildProfile('Gladson', () {}, context),
            SizedBox(height: 40),
            buildListTile('Data Saver', () {}, context),
            buildListTile('Account', () {}, context),
            buildListTile('Playback', () {}, context),
            buildListTile('Explicit Content', () {}, context),
            buildListTile('Car', () {}, context),
            buildListTile('Social', () {}, context),
            buildListTile('Connected to Apps', () {}, context),
            buildListTile('Music Quality', () {}, context),
            buildListTile('Storage', () {}, context),
            buildListTile('Notifications', () {}, context),
          ],
        ),
      ),
    );
  }

  Widget buildProfile(String name, Function tapHandler, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          child: Image.asset(
            'assets/images/img_profile.jpg',
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'View Profile',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: fontSpotifyLight),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String name, Function tapHandler, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
