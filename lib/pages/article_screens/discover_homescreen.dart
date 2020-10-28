import 'package:flutter/material.dart';
import 'package:News_App/components/circle_indicator.dart';

class DiscoverHome extends StatefulWidget {
  @override
  _DiscoverHomeState createState() => _DiscoverHomeState();
}

class _DiscoverHomeState extends State<DiscoverHome>
    with SingleTickerProviderStateMixin {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  TabController tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: txtColor,
          isScrollable: false,
          labelStyle: TextStyle(
            fontFamily: 'PoppinsSemiBold',
            fontSize: 16,
          ),
          indicator: CircleTabIndicator(color: txtColor, radius: 2),
          indicatorWeight: 4,
          controller: tabcontroller,
          tabs: [
            Tab(
              text: 'Tips & Tricks',
            ),
            Tab(
              text: 'Challenges',
            ),
          ],
        ),
        Expanded(
            child: TabBarView(controller: tabcontroller, children: [
          TipsAndTricks(),
          Challenges(),
        ]))
      ],
    );
  }
}

class TipsAndTricks extends StatefulWidget {
  @override
  _TipsAndTricksState createState() => _TipsAndTricksState();
}

class _TipsAndTricksState extends State<TipsAndTricks> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Tips and tricks'));
  }
}

class Challenges extends StatefulWidget {
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Challenges'));
  }
}
