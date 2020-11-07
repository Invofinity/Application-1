<<<<<<< HEAD
import 'package:News_App/constants.dart';
import 'package:News_App/screens/Welcome/welcome_screen.dart';
=======
import 'package:News_App/internet.dart';
>>>>>>> d72968409f48caf28405075e154a5a06f8862cb5
import 'package:News_App/views/home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:News_App/splashscreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
<<<<<<< HEAD
import 'constants.dart';
=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
>>>>>>> d72968409f48caf28405075e154a5a06f8862cb5
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

final bool debugShowCheckedModeBanner = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
<<<<<<< HEAD
      home: counter == 0 ? WelcomeScreen() : SplashScreen(),
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/home': (BuildContext context) => new Home(),
      },
=======
      home: SplashScreen(),
>>>>>>> 864a235b96a23ee49bc532c2b10cd691b93d7852
    );
  }
}

class Homie extends StatefulWidget {
  @override
  _HomieState createState() => _HomieState();
}

class _HomieState extends State<Homie> {
  ConnectivityResult previous;
  @override
  void initState() {
    super.initState();
    try {
      InternetAddress.lookup('google.com').then((result) {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Imageui(),
          ));
        } else {
          _showdialog();
        }
      }).catchError((error) {
        _showdialog();
      });
    } on SocketException catch (_) {
      // no internet
      _showdialog();
    }
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connresult) {
      if (connresult == ConnectivityResult.none) {
      } else if (previous == ConnectivityResult.none) {
        // internet conn
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Imageui(),
        ));
      }

      previous = connresult;
    });
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'ERROR',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontFamily: 'Poppins',
              color: Colors.white),
        ),
        content: Text("No Internet Detected.",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17,
                fontFamily: 'PoppinsBold',
                color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            color: Colors.black,
            // method to exit application programitacally
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: Text("Exit"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Checking Your Internet Connection."),
            ),
          ],
        ),
      ),
    );
  }
}
