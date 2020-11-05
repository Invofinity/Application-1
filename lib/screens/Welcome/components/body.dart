import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/screens/Welcome/components/background.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              height: size.height * 0.6,
            ),
            SizedBox(height: size.height * 0.0),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
