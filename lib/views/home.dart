import 'package:News_App/helper/data.dart';
import 'package:News_App/helper/news.dart';
import 'package:News_App/models/article_model.dart';
import 'package:News_App/models/category_model.dart';
import 'package:News_App/views/article_view.dart';
import 'package:News_App/views/category_news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:News_App/models/lists.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:News_App/pages/articles.dart';
import 'package:News_App/pages/discover.dart';
import 'package:News_App/pages/settings.dart';
import 'package:News_App/components/gradient.dart';
import 'package:News_App/components/circle_indicator.dart';
import 'package:News_App/pages/widgets/news_tile.dart';
import 'package:News_App/models/sections.dart';
import 'package:News_App/helper/data_new.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading;
  List<ArticleModel> articles = new List<ArticleModel>();
  int currentIndex = 0;
  var pageController = PageController();

  @override
  void initState() {
    super.initState();
    getNews();
    _loading = true;
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFFffffff);
    final up = const Color(0xFFff416c);
    //final down = const Color(0xFFff4b2b);

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: bgColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Daily",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'PoppinsBold',
                ),
              ),
            ],
          ),
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : PageView(
                children: [HomePage(), Discover(), Articles(), Settings()],
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: pageController,
              ),
        bottomNavigationBar: BubbleBottomBar(
          opacity: 0.12,
          backgroundColor: bgColor,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.animateToPage(currentIndex,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);
            });
          },
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: up,
                icon: RadiantGradientMask(
                  child: Icon(
                    Entypo.news,
                    size: 18.0,
                  ),
                ),
                activeIcon: RadiantGradientMask(
                  child: Icon(
                    Entypo.news,
                    size: 18.0,
                  ),
                ),
                title: RadiantGradientMask(
                  child: Text('News',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', fontSize: 12)),
                )),
            BubbleBottomBarItem(
                backgroundColor: up,
                icon: RadiantGradientMask(
                  child: Icon(
                    Entypo.tumblr,
                    size: 18.0,
                  ),
                ),
                activeIcon: RadiantGradientMask(
                    child: Icon(
                  Entypo.tumblr,
                  size: 18.0,
                )),
                title: RadiantGradientMask(
                  child: Text('Discover',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', fontSize: 12)),
                )),
            BubbleBottomBarItem(
                backgroundColor: up,
                icon: RadiantGradientMask(
                  child: Icon(
                    FontAwesome.book,
                    size: 18.0,
                  ),
                ),
                activeIcon: RadiantGradientMask(
                  child: Icon(
                    FontAwesome.book,
                    size: 18.0,
                  ),
                ),
                title: RadiantGradientMask(
                  child: Text('Articles',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', fontSize: 12)),
                )),
            BubbleBottomBarItem(
                backgroundColor: up,
                icon: RadiantGradientMask(
                  child: Icon(
                    Entypo.cog,
                    size: 18.0,
                  ),
                ),
                activeIcon: RadiantGradientMask(
                    child: Icon(
                  Entypo.cog,
                  size: 18.0,
                )),
                title: RadiantGradientMask(
                  child: Text('Settings',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', fontSize: 12)),
                )),
          ],
        ));
  }
}

class CategoryTile extends StatelessWidget {
  final String imageURL, categoryName;

  CategoryTile({this.imageURL, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryNews(
                category: categoryName.toLowerCase(),
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                    imageUrl: imageURL,
                    width: 120,
                    height: 60,
                    fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'PoppinsSemiBold',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageURL, title, url;

  BlogTile({@required this.imageURL, @required this.title, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageURL)),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontFamily: 'PoppinsSemiBold'),
          ),
          SizedBox(
            height: 8,
          ),
          /*Text(description,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Poppins',
              ))*/
        ]),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  int current = 0;
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  TabController tabcontroller;
  var impList = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
    fetchNews();
    tabcontroller = new TabController(vsync: this, length: 6);
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
  }

  Future<void> fetchNews() async {
    ImpNews newsClass1 = ImpNews();
    await newsClass1.getData();
    impList = newsClass1.news;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            children: <Widget>[
              //categories

              CarouselSlider(
                height: 160.0,
                aspectRatio: 9 / 16,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                onPageChanged: ((index) {
                  setState(() {
                    current = index;
                  });
                }),
                items: impList
                    .map((e) => Builder(builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: txtColor,
                                borderRadius: BorderRadius.circular(14.0),
                                image: DecorationImage(
                                  image: AssetImage(e.img),
                                  fit: BoxFit.cover,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 80.0, width: 510),
                                Container(
                                  width: 200,
                                  child: Text(
                                    //imgInf[imgList.indexOf(e)],
                                    e.head,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: bgColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }))
                    .toList(),
              ),
              SizedBox(
                height: 5,
              ),
              SelectedImage(noOfDots: imgList.length, index: current),
              SizedBox(
                height: 10,
              ),

              /*Container(
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageURL: categories[index].imageURL,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),

              //blogs
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Tile(
                        img: articles[index].urlToImage,
                        head: articles[index].title,
                        des: articles[index].url,
                      );
                    }),
              )*/
              TabBar(
                  labelColor: txtColor,
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontFamily: 'PoppinsSemiBold',
                    fontSize: 12,
                  ),
                  indicator: CircleTabIndicator(color: txtColor, radius: 2),
                  indicatorWeight: 4,
                  controller: tabcontroller,
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Politics',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Science',
                    )
                  ]),
              Expanded(
                  child: TabBarView(controller: tabcontroller, children: [
                All(),
                Business(),
                Sports(),
                Politics(),
                Entertainment(),
                Science()
              ]))
            ],
          )),
    );
  }
}
