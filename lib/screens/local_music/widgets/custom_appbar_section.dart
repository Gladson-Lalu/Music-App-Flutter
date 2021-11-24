import 'package:flutter/material.dart';

class CustomAppBarSection extends StatelessWidget {
  const CustomAppBarSection({
    Key? key,
    required double height,
    required TabController tabController,
  })  : _height = height,
        _tabController = tabController,
        super(key: key);

  final double _height;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      expandedHeight: _height,
      backgroundColor: Colors.black,
      toolbarHeight: 0,
      collapsedHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img_2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 1],
            ))),
          ),
        ]),
        centerTitle: true,
        title: Center(
          child: Text(
            "Your Music",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        titlePadding: EdgeInsets.only(top: _height / 2),
      ),
      pinned: true,
      bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: [
            Tab(
              text: "Albums",
            ),
            Tab(
              text: "Artist",
            ),
            Tab(text: "Tracks"),
            Tab(text: "Playlists"),
            Tab(text: "Generes")
          ]),
    );
  }
}
