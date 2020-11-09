import 'package:News_App/pages/article_screens/discover_homescreen.dart';
import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DiscoverWelcome(),
    );
  }
}

final bgColor = const Color(0xFFffffff);
final txtColor = const Color(0xFF171717);
final up = const Color(0xFFff416c);
final down = const Color(0xFFff4b2b);

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xFFff416c), Color(0xFFff4b2b)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class DiscoverWelcome extends StatelessWidget {
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
                text: "Discover",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 20,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.2),
            Center(
                child: Container(
                    height: 260, child: Image.asset("assets/discover.png"))),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DiscoverHome();
                    },
                  ),
                );
              },
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [up, down],
                      tileMode: TileMode.mirror,
                    )),
                child: Center(
                  child: Text(
                    'Start Discovering..',
                    style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 18.0,
                        color: bgColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
