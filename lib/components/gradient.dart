import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [up, down],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
