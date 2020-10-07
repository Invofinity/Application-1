import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/constants.dart';
import 'package:News_App/screens/Login/login_screen.dart';
import 'package:News_App/screens/SignUp/signup_screen.dart';
import 'package:News_App/screens/Welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:News_App/main.dart';

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
            RoundedButton(
              text: "LOGIN", //add fontfamily
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP", //add fontfamily
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
