import 'package:flutter/material.dart';

class TabSection extends StatelessWidget {
  const TabSection({
    Key? key,
    required TabController tabController,
    required this.tabs,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List tabs;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: 40,
          child: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1.5,
                      style: BorderStyle.solid)),
              controller: _tabController,
              tabs: List.generate(
                tabs.length,
                (index) => Tab(
                  child: Text(
                    tabs[index],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
