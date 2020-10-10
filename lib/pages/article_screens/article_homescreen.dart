//import 'package:News_App/constants.dart';
import 'package:News_App/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:News_App/helper/books.dart';
import 'package:News_App/views/book_view.dart';

class ArticlesHomeScreen extends StatefulWidget {
  @override
  _ArticlesHomeScreenState createState() => _ArticlesHomeScreenState();
}

class _ArticlesHomeScreenState extends State<ArticlesHomeScreen> {
  List<BookModel> books = new List<BookModel>();
  int currentIndex = 0;
  var pageController = PageController();

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  void getBooks() async {
    Articles newsClass = Articles();
    await newsClass.getArticles();
    books = newsClass.books;
    setState(() {});
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
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.display1,
                  children: [
                    TextSpan(
                      text: "What are you \nreading ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "today?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            /*Container(
              height: 245,
              width: 500,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 221,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 33,
                          color: ShadowColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), */
            Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ArticleTile(
                      image: books[index].image,
                      title: books[index].title,
                      description: books[index].description,
                      author: books[index].author,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final String image, title, description, author;
  ArticleTile(
      {@required this.description,
      @required this.title,
      @required this.image,
      @required this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookView(
                      blogUrl: null,
                    )));
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.only(right: 16),
        alignment: Alignment.bottomLeft,
        child: Stack(
          children: <Widget>[
            Container(
              height: 180,
              alignment: Alignment.bottomLeft,
              child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 140,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              description,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              author,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              height: 180,
              margin: EdgeInsets.only(
                left: 12,
                top: 6,
              ),
              child: Image.asset(
                image,
                height: 150,
                width: 100,
                fit: BoxFit.cover,
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
  List<BookModel> books = new List<BookModel>();

  void getBooks() async {
    Articles booksClass = Articles();
    await booksClass.getArticles();
    books = booksClass.books;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return ArticleTile(
              image: books[index].image,
              title: books[index].title,
              description: books[index].description,
              author: books[index].author,
            );
          }),
    );
  }
}
