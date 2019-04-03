import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/model/news.dart';
import 'package:flutter_ui_challenge/model/writer.dart';
import 'package:flutter_ui_challenge/widget/dialogonal_clipper.dart';
import 'package:flutter_ui_challenge/widget/bottom_navigation.dart';
import 'package:flutter_ui_challenge/widget/header.dart';
import 'package:flutter_ui_challenge/widget/news_contents.dart';
import 'package:flutter_ui_challenge/widget/opacity_animation.dart';
import 'package:flutter_ui_challenge/widget/top_text_widget.dart';

class FirstScreen extends StatefulWidget {
  static String routeName = "FirstScreen";

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ScrollController _scrollController = ScrollController();
  final TopTextWidget _topTextWidget = TopTextWidget(key: GlobalKey<TopTextWidgetState>(),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityAnimation(
        childKey: GlobalKey<OpacityAnimationState>(),
        startTime: 500,
        child: Stack(
          children: <Widget>[
            _backgroundWidget(),
            _mainContents(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _backgroundWidget() {
    return ClipPath (
      clipper: DialogonalClipper(),
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget _mainContents() {
    return Column(
      children: <Widget>[
        HeaderWidget(),
        SizedBox(
          height: 440.0,
          child: NotificationListener(
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _topTextWidget,
                _newsList(),
              ],
            ),
            onNotification: (t) {
              double position = _scrollController.position.pixels;
              if (position < 80) {
                _topTextWidget.setOpacity(position);
              }
            },
          ),
        ),
      ],
    );
  }

  void setOpacity() {
    _scrollController.position.pixels;
  }

  Widget _newsList() {
    return Row(
      children: <Widget>[
        NewsContents(news: News(imagePath: "assets/dark.jpg", title: "dark", message: "This is sample message.\nThis is sample message.", writer: Writer(name: "Daniel", imagePath: "assets/user1.jpg"))),
        NewsContents(news: News(imagePath: "assets/mountain.jpg", title: "mountain", message: "This is sample message.\nThis is sample message.", writer: Writer(name: "Catherine", imagePath: "assets/user2.jpg")),),
        NewsContents(news: News(imagePath: "assets/night.jpg", title: "night", message: "This is sample message.\nThis is sample message.", writer: Writer(name: "Nathaniel", imagePath: "assets/user3.jpg"))),
        NewsContents(news: News(imagePath: "assets/sea.jpg", title: "sea", message: "This is sample message.\nThis is sample message.", writer: Writer(name: "Jeen", imagePath: "assets/user4.jpg"))),
        NewsContents(news: News(imagePath: "assets/sun.jpg", title: "sun", message: "This is sample message.\nThis is sample message.", writer: Writer(name: "Chuck", imagePath: "assets/user5.jpg"))),
      ],
    );
  }
}
