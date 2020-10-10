import 'package:News_App/pages/article_screens/article_homescreen.dart';
import 'package:News_App/pages/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Articles',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ArticleWelcome(),
    );
  }
}

class ArticleWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "Articles",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset("assets/Articles.jpg"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: RoundedButton(
                text: "Start Reading...",
                fontSize: 18,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ArticlesHomeScreen();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
