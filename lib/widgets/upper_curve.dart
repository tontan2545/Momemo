import 'package:budget_list/constant.dart';
import 'package:flutter/material.dart';

class UpperCurve extends StatelessWidget {
  final Size size;
  final double rectRatio;
  final double curveRatio;
  final double curveHeight;

  UpperCurve(
    this.size,
    this.rectRatio,
    this.curveRatio,
    this.curveHeight,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Container(
                height: size.height * rectRatio,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                )),
            CustomPaint(
              painter: SemiOval(Theme.of(context).primaryColor, curveHeight),
              child: Container(height: size.height * curveRatio),
            ),
          ],
        ),
        Positioned(
          top: -5,
          child: Container(
            width: size.width,
            height: 20,
            color: kLightBlue,
          ),
        ),
      ],
    );
  }
}

//Semi Oval
class SemiOval extends CustomPainter {
  Color _color;
  double _kCurveHeight;

  SemiOval(this._color, this._kCurveHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = _color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
