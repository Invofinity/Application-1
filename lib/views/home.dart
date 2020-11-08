import 'package:News_App/helper/news.dart';
import 'package:News_App/models/article_model.dart';
import 'package:News_App/models/category_model.dart';
import 'package:News_App/pages/article_screens/article_homescreen.dart';
import 'package:News_App/pages/article_screens/discover_homescreen.dart';
import 'package:News_App/views/article_view.dart';
import 'package:News_App/pages/widgets/TnT_tile.dart';
import 'package:flutter/material.dart';
import 'package:News_App/models/lists.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:News_App/pages/settings.dart';
import 'package:News_App/components/gradient.dart';
import 'package:News_App/helper/data_new.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = new List<ArticleModel>();
  int currentIndex = 0;
  var pageController = PageController();

  @override
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {});
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFFff416c), Color(0xFFff4b2b)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    final bgColor = Colors.black;
    final txtColor = Colors.white;
    final down = const Color(0xFFff4b2b);

    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: bgColor,
            elevation: 0,
            title: RadiantGradientMask(
              child: Text(
                'Daily',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'PoppinsBold',
                  color: txtColor,
                ),
              ),
            ),
          ),
          body: //_loading
              /*? Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RadiantGradientMask(
                            child: Text(
                          'Please Wait....',
                          style: TextStyle(
                            fontFamily: 'PoppinsSemiBold',
                            fontSize: 16,
                            foreground: Paint()..shader = linearGradient,
                          ),
                        )),
                        SizedBox(
                          height: 60,
                        ),
                        CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: new AlwaysStoppedAnimation<Color>(down),
                        ),
                      ],
                    ),
                  ),
                )
              :*/
              SafeArea(
            child: PageView(
              children: [
                HomePage(),
                DiscoverHome(),
                ArticlesHomeScreen(),
                Settings()
              ],
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: pageController,
            ),
          ),
          bottomNavigationBar: BubbleBottomBar(
            opacity: 1.0,
            backgroundColor: bgColor,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                pageController.animateToPage(currentIndex,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.slowMiddle);
              });
            },
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: down,
                  icon: Icon(
                    Entypo.news,
                    size: 15.0,
                    color: down,
                  ),
                  activeIcon: Icon(
                    Entypo.news,
                    size: 20.0,
                    color: bgColor,
                  ),
                  title: Text('Feed',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontSize: 12,
                          color: bgColor))),
              BubbleBottomBarItem(
                  backgroundColor: down,
                  icon: Icon(
                    Feather.compass,
                    size: 15.0,
                    color: down,
                  ),
                  activeIcon: Icon(
                    Feather.compass,
                    size: 20.0,
                    color: bgColor,
                  ),
                  title: Text('Discover',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontSize: 12,
                          color: bgColor))),
              BubbleBottomBarItem(
                  backgroundColor: down,
                  icon: Icon(
                    Feather.book_open,
                    size: 15.0,
                    color: down,
                  ),
                  activeIcon: Icon(
                    Feather.book_open,
                    size: 20.0,
                    color: bgColor,
                  ),
                  title: Text('Articles',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontSize: 12,
                          color: bgColor))),
              BubbleBottomBarItem(
                  backgroundColor: down,
                  icon: Icon(
                    Feather.settings,
                    size: 15.0,
                    color: down,
                  ),
                  activeIcon: Icon(
                    Feather.settings,
                    size: 20.0,
                    color: bgColor,
                  ),
                  title: Text('Settings',
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontSize: 12,
                          color: bgColor))),
            ],
          )),
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
  //final bgColor = const Color(0xFFffffff);
  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  TabController tabcontroller;
  var impList = [];
  var feed2 = [];
  bool _loading;
  bool _loading2;

  @override
  void initState() {
    super.initState();
    //categories = getCategories();
    //getNews();
    _loading = true;
    _loading2 = true;
    fetchNews();
    fetchNews2();
    tabcontroller = new TabController(vsync: this, length: 6);
  }

  /*void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
  }*/

  Future<void> fetchNews() async {
    ImpNews newsClass1 = ImpNews();
    await newsClass1.getData();
    impList = newsClass1.news;
    setState(() {
      _loading = false;
    });
  }

  Future<void> fetchNews2() async {
    FeedCall feedcontent = FeedCall();
    await feedcontent.getData();
    feed2 = feedcontent.feed;
    setState(() {
      _loading2 = false;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child:
          LayoutBuilder(builder: (context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          primary: true,
          child: Container(
            child: Column(
              children: <Widget>[
                //categories
                _loading
                    ? Container(
                        height: 160,
                        child: Center(
                          child: Container(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(down),
                            ),
                          ),
                        ),
                      )
                    : CarouselSlider(
                        height: 170.0,
                        enlargeCenterPage: true,
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
                            .map((e) =>
                                Builder(builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ArticleView(
                                                    blogUrl: e.url,
                                                  )));
                                    },
                                    child: Stack(children: [
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            color: bgColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image: NetworkImage(e.img),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 510),
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
                                                  color: txtColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor.withOpacity(0.18),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      )
                                    ]),
                                  );
                                }))
                            .toList(),
                      ),
                SizedBox(
                  height: 5,
                ),
                SelectedImage(noOfDots: 3, index: current),
                SizedBox(
                  height: 10,
                ),
                _loading2
                    ? Container(
                        height: 500,
                        child: Center(
                          child: Container(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(down),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: feed2.length,
                            itemBuilder: (context, index) {
                              return TNTTile2(
                                img: feed2[index].img,
                                head: feed2[index].head,
                                des: feed2[index].url,
                                source: feed2[index].source,
                                tag: feed2[index].tag,
                                content: feed2[index].des,
                              );
                            }))
              ],
            ),
          ),
        );
      }),
    );
  }
}
