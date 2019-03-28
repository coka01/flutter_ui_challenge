import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/widget/first/news_item.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ContentWidget(imageName: "assets/dark.jpg", title: "dark", userName: "user"),
        ContentWidget(imageName: "assets/mountain.jpg", title: "mountain", userName: "user",),
        ContentWidget(imageName: "assets/night.jpg", title: "night", userName: "user"),
        ContentWidget(imageName: "assets/sea.jpg", title: "sea", userName: "user"),
        ContentWidget(imageName: "assets/sun.jpg", title: "sun", userName: "user"),
      ],
    );
  }
}