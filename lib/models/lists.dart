import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectedImage extends StatelessWidget {
  int noOfDots;
  int index;

  SelectedImage({this.noOfDots, this.index});
  Widget _inactiveImage() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
          height: 4.0,
          width: 4.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Color(0xFFe4e4e4),
          ),
        ),
      ),
    );
  }

  Widget _activeImage() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: Color(0xFFb2b2b2),
          ),
        ),
      ),
    );
  }

  List<Widget> buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < noOfDots; i++) {
      dots.add(i == index ? _activeImage() : _inactiveImage());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildDots(),
      ),
    );
  }
}
