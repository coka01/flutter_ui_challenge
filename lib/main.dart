import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/content_widget.dart';
import 'package:flutter_ui_challenge/dialogonal_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildMainContents(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildMainContents() {
    return Column(
      children: <Widget>[
        _buildHeaderMenu(),
        SizedBox(
          height: 440.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
            _buildTopText(),
            _buildTopImageList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopImageList() {
    return
      Row(
      children: <Widget>[
        ContentWidget(imageName: "assets/dark.jpg", title: "dark", userName: "user"),
        ContentWidget(imageName: "assets/mountain.jpg", title: "mountain", userName: "user",),
        ContentWidget(imageName: "assets/night.jpg", title: "night", userName: "user"),
        ContentWidget(imageName: "assets/sea.jpg", title: "sea", userName: "user"),
        ContentWidget(imageName: "assets/sun.jpg", title: "sun", userName: "user"),
      ],
    );
  }

  Widget _buildHeaderMenu() {
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
    );
  }

  Widget _buildTopText() {
    return Container(
      margin: EdgeInsets.only(left: 40.0, top: 40.0, bottom: 40.0),
      height: 350,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleText(),
          _buildCategoryText("See all"),
          _buildLine(),
          _buildCategoryText("news"),
          _buildCategoryText("sports"),
          _buildCategoryText("weather"),
          _buildCategoryText("radio"),
          _buildCategoryText("music"),
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Text("MOST\nPOPULAR",
        style: TextStyle(fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
      ),
    );
  }

  Widget _buildCategoryText(String title) {
    return Container(
      child: Text(title,
        style: TextStyle(fontSize: 22.0,
        color: Colors.black54),
      ),
      margin: EdgeInsets.symmetric(vertical: 4.0),
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      height: 3.0,
      width: 80.0,
      color: Colors.grey[300],
    );
  }

  Widget _buildBackground() {
    return ClipPath (
          clipper: DialogonalClipper(),
          child: Container(
            color: Colors.grey,
          ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      iconSize: 26.0,
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
            color: Colors.black87,
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,
            color: Colors.black12,
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,
            color: Colors.black54,
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.content_copy,
            color: Colors.black12,
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people,
            color: Colors.black12,
          ),
          title: Text(""),
        ),
      ],
    );
  }
}
