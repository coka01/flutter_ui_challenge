
import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  final Widget child;
  final int startTime;

  OpacityAnimation({@required this.child, @required this.startTime});

  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  static const animDuration = 1500;

  double _opacity = 0.0;
  
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: widget.startTime), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: animDuration),
      opacity: _opacity,
      child: widget.child,
    );
  }
}
