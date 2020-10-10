import 'package:News_App/screens/Login/components/background.dart';
import 'package:News_App/views/home.dart';
import 'package:flutter/material.dart';
import 'package:News_App/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:News_App/flutterfire.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  String userImg;
  String userName;
  @override
  void initState() {
    super.initState();
    _handleInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 14,
            ),
            Text(
              'Settings',
              style: TextStyle(
                  color: txtColor, fontFamily: 'PoppinsBold', fontSize: 18),
            ),
            SizedBox(
              height: 14,
            ),
            Center(
              child: (userImg != null)
                  ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(userImg),
                          )),
                    )
                  : _showLoading(),
            ),
            SizedBox(
              height: 10,
            ),
            (userName != null)
                ? Text(
                    userName,
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  )
                : Text(
                    'We are Looking for username',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  )
          ],
        ),
      ),
    );
  }

  Widget _showLoading() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Future<void> _handleInfo() async {
    try {
      GoogleSignInAccount data = await googleSignIn.signIn() ?? null;
      print(data.toString());
      if (data != null) {
        userName = data.displayName;
        userImg = data.photoUrl;
      }
    } catch (error) {
      print(error);
    }
  }
}
