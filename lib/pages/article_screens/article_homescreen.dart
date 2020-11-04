import 'package:News_App/models/book_model.dart';
import 'package:News_App/pages/widgets/article-tiless.dart';
import 'package:flutter/material.dart';
import 'package:News_App/helper/books.dart';
import 'package:News_App/views/book_view.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';

class ArticlesHomeScreen extends StatefulWidget {
  @override
  _ArticlesHomeScreenState createState() => _ArticlesHomeScreenState();
}

class _ArticlesHomeScreenState extends State<ArticlesHomeScreen> {
  var pageController = PageController();

  bool _loading;
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  @override
  void initState() {
    super.initState();
    _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child:
                  /*RichText(
                text: TextSpan(
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.display1,
                  children: [
                    TextSpan(
                      text: "What are you \nreading ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: "today?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),*/
                  Center(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //color: Color(0xFFf6f6f6),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [up, down],
                        tileMode: TileMode.mirror,
                      )),
                  child: Center(
                    child: Text(
                      "What are you reading today?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ArticlesHomePage(),
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
            )
          ],
        ),
      ),
    );
  }
}

class ArticlesHomePage extends StatefulWidget {
  @override
  _ArticlesHomePageState createState() => _ArticlesHomePageState();
}

class _ArticlesHomePageState extends State<ArticlesHomePage> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var bookss = [];
  bool _loading;
  FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    scrollController = FixedExtentScrollController();
    getBooks();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getBooks() async {
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
        : ListWheelScrollView(
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
          );
  }
}
