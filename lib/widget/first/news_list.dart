import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/widget/first/news_item.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NewsItem(imageName: "assets/dark.jpg", title: "dark", message: "This is sample message.\nThis is sample message.", userName: "user"),
        NewsItem(imageName: "assets/mountain.jpg", title: "mountain", message: "This is sample message.\nThis is sample message.", userName: "user",),
        NewsItem(imageName: "assets/night.jpg", title: "night", message: "This is sample message.\nThis is sample message.", userName: "user"),
        NewsItem(imageName: "assets/sea.jpg", title: "sea", message: "This is sample message.\nThis is sample message.", userName: "user"),
        NewsItem(imageName: "assets/sun.jpg", title: "sun", message: "This is sample message.\nThis is sample message.", userName: "user"),
      ],
    );
  }
}