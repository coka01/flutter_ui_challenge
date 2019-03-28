import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/widget/first/dialogonal_clipper.dart';
import 'package:flutter_ui_challenge/widget/first/bottom_navigation.dart';
import 'package:flutter_ui_challenge/widget/first/header.dart';
import 'package:flutter_ui_challenge/widget/first/news_list.dart';
import 'package:flutter_ui_challenge/widget/first/top_text_widget.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundWidget(),
          _mainContents(),
        ],
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TopTextWidget(),
              NewsList(),
            ],
          ),
        ),
      ],
    );
  }
}
