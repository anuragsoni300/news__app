import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class BrowserPage extends StatefulWidget {
  final String url;
  BrowserPage({this.url});
  @override
  _BrowserPageState createState() => _BrowserPageState(url: url);
}

class _BrowserPageState extends State<BrowserPage> {
  String url;

  @override
  void initState() {
    super.initState();
    if (url == null) {
      url = "https://www.google.com/";
    }
  }

  _BrowserPageState({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WebBrowser(
          initialUrl: url,
          javascriptEnabled: true,
        ),
      ),
    );
  }
}
