import 'package:News_App/components/already_have_an_account_check.dart';
import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/components/rounded_input_field.dart';
import 'package:News_App/screens/Login/components/rounded_password_field.dart';
import 'package:News_App/screens/Login/login_screen.dart';
import 'package:News_App/screens/SignUp/components/background.dart';
import 'package:News_App/screens/SignUp/components/or_divider.dart';
import 'package:News_App/screens/SignUp/components/social_icon.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "assets/signup.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            AlreadyHaveAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/facebook.png",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/twitter.png",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/google-plus.png",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
