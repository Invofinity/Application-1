import 'package:News_App/pages/widgets/article-tiless.dart';
import 'package:flutter/material.dart';
import 'package:News_App/helper/books.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ArticlesHomeScreen extends StatefulWidget {
  @override
  _ArticlesHomeScreenState createState() => _ArticlesHomeScreenState();
}

class _ArticlesHomeScreenState extends State<ArticlesHomeScreen> {
  var pageController = PageController();

  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
                    child: Center(
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: down,
                        ),
                        child: Center(
                          child: Text("What are you reading today?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'PoppinsSemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: txtColor),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ArticlesHomePage(),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      child: Center(
                        child: Text("Scroll for content",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                              color: txtColor.withOpacity(0.4),
                            ),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArticlesHomePage extends StatefulWidget {
  @override
  _ArticlesHomePageState createState() => _ArticlesHomePageState();
}

class _ArticlesHomePageState extends State<ArticlesHomePage> {
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var bookss = [];
  bool _loading;
  var incc = 0;
  var call = 1;
  var vad;
  FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    if (_loading == true) vad = 1;

    scrollController = FixedExtentScrollController();
    getBooks().then((_loading) => setState(() {
          _loading = false;
        }));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getBooks() async {
    //loadstudent
    Articles newsClass = Articles();
    await newsClass.getArticles();
    bookss = newsClass.books;
    setState(() {
      _loading = false;
    });
  }

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
        : /*ListWheelScrollView(
            itemExtent: 480,
            controller: scrollController,
            squeeze: 0.4,
            physics: FixedExtentScrollPhysics(),
            diameterRatio: 7,
            magnification: 2,
            children: bookss
                .map((e) => Builder(builder: (BuildContext context) {
                      return ArticleTile(
                        domain: e.domain,
                        title: e.title,
                        thumbnail: e.thumbnail,
                        source: e.source,
                      );
                    }))
                .toList(),
          ),*/
        CarouselSlider(
            height: 357,
            scrollDirection: Axis.vertical,
            enableInfiniteScroll: false,
            autoPlay: false,
            items: bookss
                .map((e) => Builder(builder: (BuildContext context) {
                      return ArticleTile(
                        domain: e.domain,
                        title: e.title,
                        thumbnail: e.thumbnail,
                        source: e.source,
                      );
                    }))
                .toList(),
          );
  }
}
