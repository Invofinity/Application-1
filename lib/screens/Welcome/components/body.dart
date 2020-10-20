import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/constants.dart';
import 'package:News_App/screens/Welcome/components/background.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    //this provides us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO INVOFINITY",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 18),
            ),
            SizedBox(height: size.height * 0.02),
            Image.asset(
              "assets/chat.png",
              height: size.height * 0.5,
            ),
            SizedBox(height: size.height * 0.04),
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
