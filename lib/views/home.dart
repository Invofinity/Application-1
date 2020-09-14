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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading;
  int current = 0;
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);

  @override
  void initState() {
    _loading = true;

    super.initState();
    categories = getCategories();
    getNews();
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text(
              "App",
              style:
                  TextStyle(color: Colors.blue, fontFamily: 'PoppinsSemiBold'),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      //categories
                      SizedBox(
                        height: 14,
                      ),
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
                        items: imgList
                            .map(
                                (e) => Builder(builder: (BuildContext context) {
                                      return Container(
                                        margin: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            color: txtColor,
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            image: DecorationImage(
                                              image: AssetImage(e),
                                              fit: BoxFit.cover,
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 80.0, width: 510),
                                            Container(
                                              width: 200,
                                              child: Text(
                                                imgInf[imgList.indexOf(e)],
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

                      Container(
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
                              return BlogTile(
                                imageURL: articles[index].urlToImage,
                                title: articles[index].title,
                                description: articles[index].description,
                                url: articles[index].url,
                              );
                            }),
                      )
                    ],
                  )),
            ),
    );
  }
}

// ignore: must_be_immutable
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
                    fontSize: 14,
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
  final String imageURL, title, description, url;

  BlogTile(
      {@required this.imageURL,
      @required this.title,
      @required this.description,
      @required this.url});
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
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontFamily: 'PoppinsSemiBold'),
          ),
          SizedBox(
            height: 8,
          ),
          Text(description,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Poppins',
              ))
        ]),
      ),
    );
  }
}
