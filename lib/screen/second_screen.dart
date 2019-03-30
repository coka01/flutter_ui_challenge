import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/widget/first/news_item.dart';
import 'package:flutter_ui_challenge/widget/first/opacity_animation.dart';
import 'package:flutter_ui_challenge/widget/first/user_area.dart';

class SecondScreen extends StatefulWidget {
  static String routeName = "SecondScreen";

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    final NewsItem news = ModalRoute.of(context).settings.arguments;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _newsImageWidget(maxWidth, news),
              _newsTitle(news),
            ],
          ),
          _newsMessage(news),
          OpacityAnimation(
            startTime: 500,
            child: UserArea(),
          ),
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

  Align _newsTitle(NewsItem news) {
    return Align(
              alignment: Alignment.bottomCenter,
              child: Text(news.title,
                style: TextStyle(color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            );
  }

  Widget _newsMessage(NewsItem news) {
    return OpacityAnimation(
      startTime: 500,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(news.message,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Container _newsImageWidget(double maxWidth, NewsItem news) {
    return Container(
          height: 400,
          width: maxWidth,
          child: Hero(
            tag: news.title,
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
            child: Image.asset(news.imageName, fit: BoxFit.fitWidth,),
          ),
        );
  }
}