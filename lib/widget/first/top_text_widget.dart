import 'package:flutter/material.dart';

class TopTextWidget extends StatefulWidget {
  final GlobalKey<TopTextWidgetState> key;

  TopTextWidget({this.key}) : super(key: key);

  @override
  TopTextWidgetState createState() => TopTextWidgetState();

  void setOpacity(double position) => key.currentState.setOpacity(position);
}

class TopTextWidgetState extends State<TopTextWidget> {
  static const maxOpacity = 1.0;
  static const minOpacity = 0.0;

  double _opacity = maxOpacity;

  @override
  Widget build(BuildContext context) {
    return _topText();
  }

  void setOpacity(double position) {
    setState(() {
      double result = maxOpacity - (position / 80);
      if (result <= minOpacity) _opacity = minOpacity;
      else if (result >= maxOpacity) _opacity = maxOpacity;
      else _opacity = result;
    });
  }

  Widget _topText() {
    return Opacity(
      opacity: _opacity,
        child: Container(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, bottom: 40.0),
          height: 350,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topTitle(),
              _categoryText("See all"),
              _separateLine(),
              _categoryText("news"),
              _categoryText("sports"),
              _categoryText("weather"),
              _categoryText("radio"),
              _categoryText("music"),
            ],
          ),
        ),
    );
  }

  Widget _topTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Text("MOST\nPOPULAR",
        style: TextStyle(fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
      ),
    );
  }

  Widget _separateLine() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      height: 3.0,
      width: 80.0,
      color: Colors.grey[300],
    );
  }

  Widget _categoryText(String title) {
    return Container(
      child: Text(title,
        style: TextStyle(fontSize: 22.0,
            color: Colors.black54),
      ),
      margin: EdgeInsets.symmetric(vertical: 4.0),
    );
  }
}
