import 'package:News_App/components/already_have_an_account_check.dart';
import 'package:News_App/components/rounded_button.dart';
import 'package:News_App/screens/Login/components/background.dart';
import 'package:News_App/components/rounded_input_field.dart';
import 'package:News_App/screens/Login/components/rounded_password_field.dart';
import 'package:News_App/screens/SignUp/signup_screen.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';
import 'package:News_App/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:News_App/flutterfire.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GoogleSignInAccount _currentUser;

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
<<<<<<< HEAD
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
=======
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //hello
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
          SizedBox(height: size.height * 0.05),
          GestureDetector(
            onTap: () {
              _handleSignIn();
            },
            child: Container(
              height: 45.0,
              width: 280,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: ImageIcon(AssetImage('assets/googlesignin.png')),
                    ),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text('Log in with Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    )
                  ],
                ),
              ),
>>>>>>> 5d54358fa3534a1606008fbaeb57256f2ee9f7fe
            ),
          ),
          SizedBox(height: size.height * 0.03),
          GestureDetector(
            onTap: () {
              _handleSignIn();
            },
            child: Container(
              height: 45.0,
              width: 280,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: ImageIcon(AssetImage('assets/facebook.png')),
                    ),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text('Log in with facebook',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }
}
