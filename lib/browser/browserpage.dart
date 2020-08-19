import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class BrowserPage extends StatefulWidget {
  final String url;
  BrowserPage({this.url});
  @override
  _BrowserPageState createState() => _BrowserPageState(url: url);
}

class _BrowserPageState extends State<BrowserPage> {
  final String url;

  _BrowserPageState({this.url});

  @override
  Widget build(BuildContext context) {
    return WebBrowser(
      initialUrl: url,
      javascriptEnabled: true,
    );
  }
}
