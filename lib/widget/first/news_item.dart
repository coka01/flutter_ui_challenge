
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/screen/second_screen.dart';

class NewsItem extends StatelessWidget {
  final String imageName;
  final String title;
  final String message;
  final String userName;

  NewsItem({Key key, @required this.imageName, @required this.title,
    @required this.message, @required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _contentImageArea(context),
        _contentUserArea(),
      ],
    );
  }

  Widget _contentImageArea(BuildContext context) {
    return Container(
        height: 380,
        width: 254,
        child: Hero(
            tag: "$title",
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 5.0),
                    child: GestureDetector(
                      child: Image.asset(imageName, fit: BoxFit.fitWidth,),
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
                  child: Text(title,
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

  Widget _contentUserArea() {
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