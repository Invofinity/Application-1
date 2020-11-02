import 'package:flutter/material.dart';
import 'package:News_App/components/circle_indicator.dart';
import 'package:News_App/helper/data_new.dart';
import 'package:News_App/pages/widgets/TnT_tile.dart';

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
    return Scaffold(
      body: Column(
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
      ),
    );
  }
}

class TipsAndTricks extends StatefulWidget {
  @override
  _TipsAndTricksState createState() => _TipsAndTricksState();
}

class _TipsAndTricksState extends State<TipsAndTricks> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles6 = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data6 newsClass6 = Data6();
    await newsClass6.getData();
    allarticles6 = newsClass6.articles6;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles6.length,
            itemBuilder: (context, index) {
              return TNTTile(
                img: allarticles6[index].img,
                head: allarticles6[index].head,
                des: allarticles6[index].url,
                source: allarticles6[index].source,
                tag: allarticles6[index].tag,
                content: allarticles6[index].des,
              );
            });
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
