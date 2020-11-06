import 'package:News_App/pages/widgets/challenges_tile.dart';
import 'package:flutter/cupertino.dart';
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
  //final bgColor = const Color(0xFFffffff);
  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  TabController tabcontroller;

  @override
  void initState() {
    super.initState();
    tabcontroller = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
              Challenges1(),
            ]),
          ),
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
  //final bgColor = const Color(0xFFffffff);
  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
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
    if (_loading) {
      return Container(
        height: 300,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: new AlwaysStoppedAnimation<Color>(down),
          ),
        ),
      );
    } else {
      return ListView.builder(
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
}

class Challenges1 extends StatefulWidget {
  @override
  _Challenges1State createState() => _Challenges1State();
}

class _Challenges1State extends State<Challenges1> {
  //final bgColor = const Color(0xFFffffff);
  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  final border = Colors.grey[300];
  final border1 = Colors.grey[400];
  var allchallenges = [];
  bool _loading;
  int cupertinoindex = 0;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    ChallengesCall challenges = ChallengesCall();
    await challenges.getData();
    allchallenges = challenges.challengeslist;
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
        : Container(
            child: Column(
              children: [
                /*Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Feather.archive,
                          size: 15,
                          color: up,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Challenges",
                          style: TextStyle(
                            fontFamily: 'PoppinsSemiBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: txtColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),*/
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Color(0xFFf6f6f6),
                      color: Colors.grey[850],
                    ),
                    child: Center(
                      child: Text(
                        "Mental Health",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: txtColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 20,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Scroll for content",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: txtColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 400,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 120,
                      squeeze: 0.2,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 4,
                      magnification: 1.5,
                      childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                        if (index < 0 || index > (allchallenges.length - 1)) {
                          return null;
                        }
                        return ChallengesTile(
                          day: allchallenges[index].day,
                          task: allchallenges[index].task,
                          index: index,
                          length: allchallenges.length,
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: Container(
                        height: 60,
                        child: Image.asset('assets/challenges1.svg')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        "More challenges coming soon....",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: txtColor.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
