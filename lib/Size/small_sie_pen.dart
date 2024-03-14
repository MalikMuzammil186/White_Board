// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
class SmallSizeStroke extends CustomPainter {
  final List<Path> strokes;
  SmallSizeStroke({
    required this.strokes,
  });
  @override
  void paint(Canvas canvas, Size size) {
    for (var stroke in strokes) {
      final paint=Paint()
      ..strokeWidth=5
      ..color=Colors.blue
      ..style=PaintingStyle.fill;
      canvas.drawPath(stroke, paint);
      
    }
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  
  }
  
}
