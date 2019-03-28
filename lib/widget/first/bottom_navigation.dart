import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
