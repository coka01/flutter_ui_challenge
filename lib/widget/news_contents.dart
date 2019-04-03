
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/model/news.dart';
import 'package:flutter_ui_challenge/screen/second_screen.dart';
import 'package:flutter_ui_challenge/widget/writer_area.dart';

class NewsContents extends StatelessWidget {
  final News news;

  NewsContents({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _contentImageArea(context),
        WriterArea(writer: news.writer),
      ],
    );
  }

  Widget _contentImageArea(BuildContext context) {
    return Container(
        height: 380,
        width: 254,
        child: Hero(
            tag: "${news.title}",
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 5.0),
                    child: GestureDetector(
                      child: Image.asset(news.imagePath, fit: BoxFit.fitWidth,),
                      onTap: () {
                        Navigator.of(context).pushNamed(SecondScreen.routeName,
                            arguments: this);
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 10.0, bottom: 30.0),
                  child: Text(news.title,
                    style: TextStyle(color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}