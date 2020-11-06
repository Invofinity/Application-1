// import 'dart:async';
// import 'dart:io';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(home: HomePage()));

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Map _source = {ConnectivityResult.none: false};
//   MyConnectivity _connectivity = MyConnectivity.instance;

//   @override
//   void initState() {
//     super.initState();
//     _connectivity.initialise();
//     _connectivity.myStream.listen((source) {
//       setState(() => _source = source);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String string;
//     switch (_source.keys.toList()[0]) {
//       case ConnectivityResult.none:
//         string = "Offline";
//         break;
//       case ConnectivityResult.mobile:
//         string = "Mobile: Online";
//         break;
//       case ConnectivityResult.wifi:
//         string = "WiFi: Online";
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text("Internet")),
//       body: Center(child: Text("$string", style: TextStyle(fontSize: 36))),
//     );
//   }

//   @override
//   void dispose() {
//     _connectivity.disposeStream();
//     super.dispose();
//   }
// }

// class MyConnectivity {
//   MyConnectivity._internal();

//   static final MyConnectivity _instance = MyConnectivity._internal();

//   static MyConnectivity get instance => _instance;

//   Connectivity connectivity = Connectivity();

//   StreamController controller = StreamController.broadcast();

//   Stream get myStream => controller.stream;

//   void initialise() async {
//     ConnectivityResult result = await connectivity.checkConnectivity();
//     _checkStatus(result);
//     connectivity.onConnectivityChanged.listen((result) {
//       _checkStatus(result);
//     });
//   }

//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         isOnline = true;
//       } else

//   void disposeStream() {}

import 'dart:async';
import 'dart:io';

import 'package:News_App/pages/discover.dart';
import 'package:News_App/screens/Welcome/components/body.dart';
import 'package:News_App/screens/Welcome/welcome_screen.dart';
import 'package:News_App/views/home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class imageui extends StatefulWidget {
  @override
  _imageuiState createState() => _imageuiState();
}

class _imageuiState extends State<imageui> {
  StreamSubscription connectivitySubscription;

  ConnectivityResult _previousResult;

  bool dialogshown = false;
  Future<bool> checkinternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      }
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }

  @override
  void initState() {
    super.initState();

    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connresult) {
      if (connresult == ConnectivityResult.none) {
        dialogshown = true;
        showDialog(
          context: context,
          barrierDismissible: false,
          child: AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              "Error",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'PoppinsBold',
                  color: Colors.white),
            ),
            content: Text(
              "No Data Connection Available.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'PoppinsBold',
                  color: Colors.white),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.black,
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: Text("Exit."),
              ),
            ],
          ),
        );
      } else if (_previousResult == ConnectivityResult.none) {
        checkinternet().then((result) {
          if (result == true) {
            if (dialogshown == true) {
              dialogshown = false;
              Navigator.pop(context);
            }
          }
        });
      }

      _previousResult = connresult;
    });
  }

  @override
  void dispose() {
    super.dispose();

    connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: Home());
  }
}
