import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

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
