
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/model/writer.dart';

class WriterArea extends StatelessWidget {

  final Writer writer;

  WriterArea({Key key, this.writer}) : super(key: key);

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
              image: DecorationImage(image: AssetImage(writer.imagePath),),
            ),
          ),
          Text(writer.name,
            style: TextStyle(fontSize: 18.0,
                fontStyle: FontStyle.italic
            ),
          ),
        ],
      ),
    );
  }
}
