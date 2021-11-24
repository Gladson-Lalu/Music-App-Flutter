import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/album.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomSilverAppBarDelegate(
          album, MediaQuery.of(context).size.width - 30, kToolbarHeight + 60),
      pinned: true,
    );
  }
}

class CustomSilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Album _album;
  final double _extendedHeight;
  final double _minHeight;
  double _range;

  CustomSilverAppBarDelegate(this._album, this._extendedHeight, this._minHeight)
      : _range = _extendedHeight - _minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double _opacity = shrinkOffset > _range ? 1 : shrinkOffset / _range;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Icon(MaterialIcons.favorite_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert_outlined), onPressed: () {})
          ],
          title: Opacity(
              opacity: _opacity,
              child: Text(
                _album.title,
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Stack(children: [
            Positioned.fill(
              child: Image(
                image: _album.coverImageProvider,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.xor,
                color: Colors.black.withOpacity(_opacity),
              ),
            ),
            Positioned.fill(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1],
            )))),
          ]),
        ),
        Positioned(
          bottom: -30,
          left: MediaQuery.of(context).size.width / 2 - 79,
          child: Card(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                child: Text(
                  "Shuffle play",
                  style: TextStyle(
                      fontFamily: fontSpotify,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                )),
            color: Color.fromRGBO(40, 193, 96, 1.0),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28))),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _extendedHeight;

  @override
  double get minExtent => _minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
