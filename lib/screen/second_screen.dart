import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/model/writer.dart';
import 'package:flutter_ui_challenge/widget/news_contents.dart';
import 'package:flutter_ui_challenge/widget/opacity_animation.dart';
import 'package:flutter_ui_challenge/widget/writer_area.dart';

class SecondScreen extends StatefulWidget {
  static String routeName = "SecondScreen";

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  OpacityAnimation _userWidget;
  OpacityAnimation _newsMessageWidget;

  @override
  Widget build(BuildContext context) {
    final NewsContents news = ModalRoute.of(context).settings.arguments;
    final double maxWidth = MediaQuery.of(context).size.width;

    _userWidget =  _writer(news.news.writer);
    _newsMessageWidget = _newsMessage(news);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _newsImageWidget(maxWidth, news),
              _newsTitle(news),
            ],
          ),
          _newsMessageWidget,
          _userWidget,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 26.0,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              title: Text(""),
            ),
          ]
      ),
    );
  }

  OpacityAnimation _writer(Writer writer) {
    return OpacityAnimation(
          childKey: GlobalKey<OpacityAnimationState>(),
          startTime: 500,
          child: WriterArea(writer: writer,),
        );
  }

  Align _newsTitle(NewsContents news) {
    return Align(
              alignment: Alignment.bottomCenter,
              child: Text(news.news.title,
                style: TextStyle(color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            );
  }

  Widget _newsMessage(NewsContents news) {
    return OpacityAnimation(
      childKey: GlobalKey<OpacityAnimationState>(),
      startTime: 500,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(news.news.message,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget _newsImageWidget(double maxWidth, NewsContents news) {
    return GestureDetector(
      onVerticalDragEnd: (details) {

      },
      child: Container(
        height: 400,
        width: maxWidth,
        child: Hero(
          tag: news.news.title,
          flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
            final Hero toHero = toContext.widget;
            return ScaleTransition(
              scale: animation.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(
                    curve: Interval(0.0, 1.0,
                        curve: Curves.easeInOut),
                  ),
                ),
              ),
              child: direction == HeroFlightDirection.push
                  ? RotationTransition(
                turns: animation,
                child: toHero.child,
              )
                  : FadeTransition(
                opacity: animation.drive(
                  Tween<double>(begin: 0.0, end: 1.0).chain(
                    CurveTween(
                      curve: Interval(0.0, 1.0,
                          curve: Curves.easeInOut),
                    ),
                  ),
                ),
                child: toHero.child,
              ),
            );
          },
          child: Image.asset(news.news.imagePath, fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }

  void dismissView() {
    _userWidget.dismissView();
    _newsMessageWidget.dismissView();
  }
}