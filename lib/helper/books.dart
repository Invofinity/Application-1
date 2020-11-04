import 'dart:convert';
import 'package:News_App/models/book_model.dart';
import 'package:http/http.dart' as http;

class Articles {
  List<BookModel> books = [];

  Future<void> getArticles() async {
    String url =
        "https://fir-news-api-veokara.firebaseio.com/articlesreddit.json";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      BookModel bookModel = BookModel(
        title: element['title'],
        source: element['source'],
        //  tag: element['tag'],
        //des: element['selftext'],
        // des: element['description'],
        thumbnail: element['thumbnail'],
        domain: element['domain'],
        // content: element['content'],
        //source: element['source'].name,
        // time: element['publishedAt'],
      );

      books.add(bookModel);
    });
  }
}
