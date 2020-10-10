import 'package:News_App/components/already_have_an_account_check.dart';
import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/screens/Login/components/background.dart';
import 'package:News_App/components/rounded_input_field.dart';
import 'package:News_App/screens/Login/components/rounded_password_field.dart';
import 'package:News_App/screens/SignUp/signup_screen.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 18),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/login (1).png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
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
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAccountCheck(
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
