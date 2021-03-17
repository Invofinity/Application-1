import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:News_App/models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

class Data {
  List<NewsArticles> articles = [];

  Future<void> getData() async {
    try {
      var response = await get(
          'https://fir-news-api-veokara.firebaseio.com/futurelogy.json');

      var jsonData = jsonDecode(response.body);

      jsonData.forEach((element) {
        NewsArticles newsarticles = NewsArticles(
          head: element['title'],
          //des: element['description'],
          img: element['thumbnail'],
          url: element['domain'],
          //content: element['content'],
          //source: element['source[name]'],
          //time: element['publishedAt'],
        );
        articles.add(newsarticles);
      });
    } on SocketException catch (_) {
      print('not connected');
    }
  }
}

class Data1 {
  List<NewsArticles> articles1 = [];

  Future<void> getData() async {
    var response =
        await get('https://fir-news-api-veokara.firebaseio.com/newsindia.json');
    var jsonData = jsonDecode(response.body);
    //if (jsonData['status'] == "ok") {
    jsonData.forEach((element) {
      //if (element['urlToImage'] != null && element['description'] != null) {
      NewsArticles newsarticles1 = NewsArticles(
        head: element['title'],
        /*des: element['description'],*/
        img: element['thumbnail'],
        url: element['domain'],
        /*content: element['content'],
            //source: element['source'].name,
            time: element['publishedAt'],*/
      );
      articles1.add(newsarticles1);
      //}
    });
    //}
  }
}

class Data2 {
  List<NewsArticles> articles2 = [];

  Future<void> getData() async {
    var response =
        await get('https://fir-news-api-veokara.firebaseio.com/memes.json');
    var jsonData = jsonDecode(response.body);
    //if (jsonData['status'] == "ok") {
    jsonData.forEach((element) {
      //if (element['urlToImage'] != null && element['description'] != null) {
      NewsArticles newsarticles2 = NewsArticles(
        head: element['title'],
        /*des: element['description'],*/
        img: element['thumbnail'],
        url: element['domain'],
        //content: element['content'],
        //source: element['source'].name,
        //time: element['publishedAt'],
      );
      articles2.add(newsarticles2);
      //}
    });
    //}
  }
}

class Data3 {
  List<NewsArticles> articles3 = [];

  Future<void> getData() async {
    var response =
        await get('https://fir-news-api-veokara.firebaseio.com/health.json');
    var jsonData = jsonDecode(response.body);
    //if (jsonData['status'] == "ok") {
    jsonData.forEach((element) {
      //if (element['urlToImage'] != null && element['description'] != null) {
      NewsArticles newsarticles3 = NewsArticles(
        head: element['title'],
        // des: element['description'],
        img: element['thumbnail'],
        url: element['domain'],
        // content: element['content'],
        //source: element['source'].name,
        // time: element['publishedAt'],
      );
      articles3.add(newsarticles3);
      // }
    });
    //}
  }
}

class Data4 {
  List<NewsArticles> articles4 = [];

  Future<void> getData() async {
    var response = await get(
        'https://fir-news-api-veokara.firebaseio.com/todayilearned.json');
    var jsonData = jsonDecode(response.body);
    //if (jsonData['status'] == "ok") {
    jsonData.forEach((element) {
      //if (element['urlToImage'] != null && element['description'] != null) {
      NewsArticles newsarticles4 = NewsArticles(
        head: element['title'],
        //des: element['description'],
        img: element['thumbnail'],
        url: element['domain'],
        //content: element['content'],
        //source: element['source'].name,
        //time: element['publishedAt'],
      );
      articles4.add(newsarticles4);
      // }
    });
    //}
  }
}

class Data5 {
  List<NewsArticles> articles4 = [];

  Future<void> getData() async {
    var response =
        await get('https://fir-news-api-veokara.firebaseio.com/science.json');
    var jsonData = jsonDecode(response.body);
    //if (jsonData['status'] == "ok") {
    jsonData.forEach((element) {
      //if (element['urlToImage'] != null && element['description'] != null) {
      NewsArticles newsarticles4 = NewsArticles(
        head: element['title'],
        //des: element['description'],
        img: element['thumbnail'],
        url: element['domain'],
        //content: element['content'],
        //source: element['source'].name,
        //time: element['publishedAt'],
      );
      articles4.add(newsarticles4);
      // }
    });
    //}
  }
}

class ImpNews {
  List<ImportantNews> news = [];
  Future<void> getData() async {
    try {
      var response = await get(
          'https://fir-news-api-veokara.firebaseio.com/importantnews.json');
      var jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        ImportantNews importantnews = ImportantNews(
            head: element['title'],
            img: element['thumbnail'],
            url: element['domain']);
        news.add(importantnews);
      });
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class Data6 {
  List<NewsArticles> articles6 = [];

  Future<void> getData() async {
    try {
      var response = await get(
          'https://fir-news-api-veokara.firebaseio.com/discover.json');
      var jsonData = jsonDecode(response.body);
      //if (jsonData['status'] == "ok") {
      jsonData.forEach((element) {
        //if (element['urlToImage'] != null && element['description'] != null) {
        NewsArticles newsarticles6 = NewsArticles(
          head: element['title'],
          source: element['source'],
          tag: element['tag'],
          des: element['selftext'],
          // des: element['description'],
          img: element['thumbnail'],
          url: element['domain'],
          // content: element['content'],
          //source: element['source'].name,
          // time: element['publishedAt'],
        );
        articles6.add(newsarticles6);
        // }
      });
      //}
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class ChallengesCall {
  var jsonData;
  List<Challenges> challengeslist = [];
  Future<void> getData() async {
    var response = await get(
        'https://fir-news-api-veokara.firebaseio.com/challenges.json');

    try {
      jsonData = await jsonDecode(response.body);
    } on SocketException {
      throw Failure("no Internet connection");
    }
    if (response.statusCode == 200) {
      jsonData.forEach((element) {
        Challenges challenges = Challenges(
          day: element['day'],
          task: element['task'],
        );
        challengeslist.add(challenges);
      });
    }
  }
}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class FeedCall {
  List<NewsArticles> feed = [];
  //final databaseReference = FirebaseDatabase.instance.collection("feed");

  Future<void> getData(int k) async {
    var response;
    var response1;
    //var jsonData = [];
      var rng = new Random();
    for (var i = 0; i < 10; i++) {
      k = rng.nextInt(60);
    }
    try {
      var response =
          await get('https://fir-news-api-veokara.firebaseio.com/feed/$k.json');
      // response1 = databaseReference.once();
      var jsonData = jsonDecode(response.body);
      print(response.statusCode);
      //print(jsonData);
      //if (response.statusCode == 200) {
      //if (jsonData['status'] == "ok") {
      //jsonData.forEach((element) {
      NewsArticles feed1 = NewsArticles(
        head: jsonData['title'],
        source: jsonData['source'],
        tag: jsonData['tag'],
        des: jsonData['selftext'],
        img: jsonData['thumbnail'],
        url: jsonData['domain'],
      );
      print(feed1);
      feed.add(feed1);
      //}
      // }
      //);
      //}
      //}
    } catch (e) {}
  }
}

class RateUs {
  List<Rate> link = [];
  Future<void> getData() async {
    try {
      var response = await get(
          'https://fir-news-api-veokara.firebaseio.com/settingsLink.json');
      var jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        Rate rateus = Rate(
          url: element['Link1'],
        );
        link.add(rateus);
      });
    } catch (e) {
      print(e);
      return null;
    }
  }
}
