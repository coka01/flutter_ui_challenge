
import 'package:flutter/material.dart';

class UserArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              image: DecorationImage(image: AssetImage("assets/dark.jpg"),),
            ),
          ),
          Text("user",
            style: TextStyle(fontSize: 18.0,
                fontStyle: FontStyle.italic
            ),
          ),
        ],
      ),
    );
  }
}
