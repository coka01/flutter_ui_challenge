import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/widget/first/news_item.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NewsItem(imageName: "assets/dark.jpg", title: "dark", userName: "user"),
        NewsItem(imageName: "assets/mountain.jpg", title: "mountain", userName: "user",),
        NewsItem(imageName: "assets/night.jpg", title: "night", userName: "user"),
        NewsItem(imageName: "assets/sea.jpg", title: "sea", userName: "user"),
        NewsItem(imageName: "assets/sun.jpg", title: "sun", userName: "user"),
      ],
    );
  }
}