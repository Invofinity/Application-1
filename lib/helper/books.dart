import 'dart:convert';
import 'dart:io';
import 'package:News_App/models/models.dart';
import 'package:http/http.dart' as http;

class Articles {
  List<BookModel> books = [];

  Future<void> getArticles() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }

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
    } on SocketException catch (e) {
      print('not connected');
      print(e.message);
    }
  }
}
