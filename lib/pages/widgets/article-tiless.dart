import 'package:News_App/views/article_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';

class ArticleTile extends StatefulWidget {
  final String thumbnail, title, domain, source;
  ArticleTile({this.domain, this.title, this.thumbnail, this.source});

  @override
  _ArticleTileState createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  //final bgColor = const Color(0xFFffffff);
  final cardColor = const Color(0xFFf8f8f8);
  //final txtColor = const Color(0xFF171717);
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final border = Colors.grey[300];
  final border1 = Colors.grey[400];

  _onShare(BuildContext context, String url) async {
    final RenderBox box = context.findRenderObject();
    await Share.share(url,
        subject: 'Invofinity',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl:
                          widget.domain != null ? widget.domain.toString() : "",
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 66),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Color(0xFFf6f6f6),
          color: Colors.grey[850].withOpacity(0.4),
        ),
        alignment: Alignment.bottomLeft,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 46,
                  //height: size.height * 0.20,
                  height: 172,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: bgColor,
                    image: DecorationImage(
                        image: NetworkImage(
                          widget
                              .thumbnail /*!= null
                              ? widget.thumbnail.toString()
                              : ""*/
                          ,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 124,
                  width: MediaQuery.of(context).size.width - 46,
                  child: Text(
                    widget.title /*!= null ? widget.title.toString() : ""*/,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'PoppinsSemiBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: txtColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                          "Author : " +
                              (widget
                                  .source /*!= null
                                  ? widget.source.toString()
                                  : ""*/
                              ),
                          style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: border1)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 280),
                    GestureDetector(
                      onTap: () => _onShare(
                          context,
                          widget
                              .domain /*!= null
                              ? widget.domain.toString()
                              : ""*/
                          ),
                      child: Container(
                        child: Icon(
                          Feather.share_2,
                          size: 16,
                          color: border1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            )),
      ),
    );
  }
}
