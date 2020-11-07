/*import 'package:News_App/screens/Login/components/background.dart';
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
}*/

import 'package:News_App/pages/widgets/extra_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:News_App/helper/data_new.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int currentIndex;
  bool receive = true;
  var linkk = [];
  var linkkk;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future<void> fetchNews() async {
    RateUs newsClass4 = RateUs();
    await newsClass4.getData();
    linkk = newsClass4.link;
  }

  Future getLink() async {
    var response = await get(
        'https://fir-news-api-veokara.firebaseio.com/settingsLink.json');
    var jsonData = jsonDecode(response.body);
    jsonData.forEach((element) {
      linkkk = element['Link1'];
    });
  }

  Future<void> _launch() async {
    await launch(linkk[0].url);
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject();
    await Share.share('Download the Daily App-' + linkk[0].url,
        subject: 'Invofinity',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
    receive
        ? _fcm.subscribeToTopic('Invofinity')
        : _fcm.unsubscribeFromTopic('Invofinity');
  }

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset:
    false;
    //final bgColor = const Color(0xFFffffff);
    //final txtColor = const Color(0xFF171717);
    final bgColor = Colors.black;
    final txtColor = Colors.white;
    final up = const Color(0xFFff416c);
    final cardColor = const Color(0xFFf8f8f8);
    final down = const Color(0xFFff4b2b);
    final switchColor = const Color(0xFFFF483C);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () => {
                    receive ? receive = false : receive = true,
                  },
                  child: Container(
                    height: 24,
                    width: MediaQuery.of(context).size.width,
                    color: bgColor,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Icon(
                            Feather.bell,
                            color: txtColor,
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Container(
                            width: 250,
                            child: Text('Notifications',
                                style: TextStyle(
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: 15,
                                  color: txtColor,
                                ),
                                overflow: TextOverflow.visible),
                          ),
                          SizedBox(width: size.width * 0.08),
                          Switch(
                            value: receive,
                            activeColor: down,
                            inactiveThumbColor: Colors.grey[200],
                            activeTrackColor: Colors.grey[400].withOpacity(0.4),
                            inactiveTrackColor:
                                Colors.grey[200].withOpacity(0.4),
                            onChanged: (value) {
                              setState(() {
                                value
                                    ? _fcm.subscribeToTopic('Invofinity')
                                    : _fcm.unsubscribeFromTopic('Invofinity');
                                receive = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  //height: 394,
                  height: (MediaQuery.of(context).size.height) - 212,
                  width: MediaQuery.of(context).size.width,
                  //color: cardColor,
                  color: Colors.grey[850].withOpacity(0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => _onShare(context),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('Share',
                                  style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontSize: 13,
                                      color: txtColor),
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => {
                          _launch(),
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('Rate Us',
                                  style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontSize: 13,
                                      color: txtColor),
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Help()));
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('Help & FAQ',
                                  style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontSize: 13,
                                      color: txtColor),
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('About Us',
                                  style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontSize: 13,
                                      color: txtColor),
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Terms()));
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('Terms & Conditions',
                                  style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontSize: 13,
                                      color: txtColor),
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicy()));
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('Privacy Policy',
                                  style: TextStyle(
                                      fontFamily: 'PoppinsSemiBold',
                                      fontSize: 13,
                                      color: txtColor),
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
