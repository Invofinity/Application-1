import 'package:News_App/screens/Welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Body extends StatelessWidget {
  final bgColor = Colors.black;
  final txtColor = Colors.white;
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
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
              "assets/welcome.png",
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
                "Happy to see you!",
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return homie();
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
