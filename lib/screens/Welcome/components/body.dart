import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/constants.dart';
import 'package:News_App/main.dart';
import 'package:News_App/screens/Welcome/components/background.dart';
import 'package:News_App/screens/Welcome/welcome_screen.dart';
import 'package:News_App/splashscreen.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

var incc = 0;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final bgColor = Colors.black;

  final txtColor = Colors.white;

  final up = const Color(0xFFff416c);

  final down = const Color(0xFFff4b2b);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*Text(
              "Welcome to DAILY \n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 25),
            ),
            Text(
              "by Invofinity",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
            SizedBox(height: size.height * 0.15),*/
            Image.asset(
              "assets/welcome1.png",
              height: size.height * 0.5,
            ),
            SizedBox(height: size.height * 0.0),
            /*Container(
              child: RoundedButton(
                text: "Get Started...", //add fontfamily
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                },
              ),
            ),*/
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontFamily: 'PoppinsBold', fontSize: 38.0, color: txtColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Lets Get Started",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                    color: txtColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter += 1;
                });
                value = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SplashScreen();
                    },
                  ),
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: down,
                  /*gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [up, down],
                      tileMode: TileMode.mirror,
                    )*/
                ),
                child: Center(
                    child: Icon(
                  Feather.arrow_right,
                  size: 30,
                  color: bgColor,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
