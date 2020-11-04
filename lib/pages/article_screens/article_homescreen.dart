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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Articles_top.png"),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
              child: RichText(
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
              ),
            ),
            Expanded(
              child: ArticlesHomePage(),
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
  @override
  void initState() {
    super.initState();
    _loading = true;
    getBooks();
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
        : Container(
            height: 400,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 380,
              squeeze: 0.4,
              physics: FixedExtentScrollPhysics(),
              diameterRatio: 7,
              magnification: 2,
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index > (bookss.length - 1)) {
                    return null;
                  }
                  return ArticleTile(
                    thumbnail: bookss[index].thumbnail,
                    title: bookss[index].title,
                    domain: bookss[index].description,
                    source: bookss[index].author,
                  );
                },
              ),
            ),
          );
  }
}
