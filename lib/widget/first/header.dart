import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("Popular",
                style: TextStyle(fontSize: 21.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text("Latest",
                style: TextStyle(fontSize: 21.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Futured",
                style: TextStyle(fontSize: 21.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
