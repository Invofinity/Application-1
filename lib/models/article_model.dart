class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel({
    this.author,
    this.title,
    this.url,
    this.content,
    this.urlToImage,
    this.description,
  });
}

class NewsArticles {
  String head;
  String des;
  String img;
  String url;
  String tag;
  String source;
  String time;

  NewsArticles(
      {this.head,
      this.des,
      this.img,
      this.url,
      this.tag,
      this.time,
      this.source});
}

class ImportantNews {
  String head;
  String img;
  String url;

  ImportantNews({this.head, this.img, this.url});
}
