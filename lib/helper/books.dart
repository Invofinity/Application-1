import 'dart:convert';
import 'package:News_App/models/book_model.dart';
import 'package:http/http.dart' as http;

class Articles {
  List<BookModel> books = [];

  Future<void> getArticles() async {
    String url =
        "https://fir-news-api-veokara.firebaseio.com/articlSection.json";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      BookModel bookModel = BookModel(
        title: element["title"],
        author: element["author"],
        description: element["description"],
        image: element["image"],
        content: element["content"],
      );

      books.add(bookModel);
    });
  }
}
