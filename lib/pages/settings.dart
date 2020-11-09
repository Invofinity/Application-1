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
    await Share.share(
        'Download the Daily App for daily dose of articles,challenges and feed-' +
            linkk[0].url,
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
    // ignore: unnecessary_statements
    false;
    //final bgColor = const Color(0xFFffffff);
    //final txtColor = const Color(0xFF171717);
    final bgColor = Colors.black;
    final txtColor = Colors.white;
    final down = const Color(0xFFff4b2b);
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
                              MaterialPageRoute(builder: (context) => Help()));
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text('HELP & FAQ',
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
