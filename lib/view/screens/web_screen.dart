import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';
import 'package:webview_flutter/webview_flutter.dart';  /// [tegaki]



class WebScreen extends StatelessWidget {

  final Article article;
  const WebScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title: Text(article.title),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: article.networkImage,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}