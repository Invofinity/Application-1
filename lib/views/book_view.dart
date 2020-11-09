import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookView extends StatefulWidget {
  final String blogUrl;
  BookView({@required this.blogUrl});

  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewController) {
          _controller.complete(webViewController);
        }),
      ),
    ));
  }
}
