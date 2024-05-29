import 'dart:ui';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = primary2
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2720000, size.height * 0.2836000);
    path_0.lineTo(size.width * 0.6133333, size.height * 0.2900000);
    path_0.lineTo(size.width * 0.6183333, size.height * 0.6000000);
    path_0.quadraticBezierTo(size.width * 0.5536667, size.height * 0.4820000,
        size.width * 0.4743333, size.height * 0.5120000);
    path_0.quadraticBezierTo(size.width * 0.3538333, size.height * 0.5523000,
        size.width * 0.3790000, size.height * 0.3900000);
    path_0.quadraticBezierTo(size.width * 0.3787500, size.height * 0.2836000,
        size.width * 0.2666667, size.height * 0.2812000);
    path_0.quadraticBezierTo(size.width * 0.3833333, size.height * 0.2862000,
        size.width * 0.2720000, size.height * 0.2836000);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
