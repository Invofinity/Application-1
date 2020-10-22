import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  ArticleView({@required this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  final down = const Color(0xFFff4b2b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Daily",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'PoppinsBold',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WebView(
              initialUrl: widget.blogUrl,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              onWebViewCreated: ((WebViewController webViewController) {
                _controller.complete(webViewController);
              }),
            ),
          ),
          isLoading
              ? LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  minHeight: 1.5,
                  valueColor: new AlwaysStoppedAnimation<Color>(down),
                )
              : Stack(),
        ]));
  }
}
