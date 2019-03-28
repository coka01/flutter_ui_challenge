
import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  final String imageName;
  final String title;
  final String userName;

  ContentWidget({Key key, @required this.imageName, @required this.title,
    @required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _contentImageView(),
        _contentText(),
      ],
    );
  }

  Widget _newsList() {
    return Column(
      children: <Widget>[
        _contentImageView(),
        _contentText(),
      ],
    );
  }

  Widget _contentImageView() {
    return Container(
      height: 380,
      width: 254,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Image.asset(imageName, fit: BoxFit.fill,),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 30.0),
            child: Text(title,
              style: TextStyle(color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentText() {
    return Container(
      height: 35,
      width: 254,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(imageName),),
            ),
          ),
          Text(userName,
            style: TextStyle(fontSize: 18.0,
              fontStyle: FontStyle.italic
            ),
          ),
        ],
      ),
    );
  }
}