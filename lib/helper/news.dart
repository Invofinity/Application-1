import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:News_App/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://fir-news-api-veokara.firebaseio.com/cricket.json";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      ArticleModel articleModel = ArticleModel(
        title: element['title'],
        //author: element["author"],
        //description: element["description"],
        url: element["domain"],
        urlToImage: element["thumbnail"],
        //content: element["content"]
      );

      news.add(articleModel);
    });
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url = "https://fir-news-api-veokara.firebaseio.com/$category.json";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      ArticleModel articleModel = ArticleModel(
        title: element['title'],
        //author: element["author"],
        //description: element["description"],
        url: element["domain"],
        urlToImage: element["thumbnail"],
        //content: element["content"]
      );

      news.add(articleModel);
    });
  }
}
