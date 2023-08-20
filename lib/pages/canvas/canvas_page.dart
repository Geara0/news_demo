import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/theme.dart';

@RoutePage()
class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  late var _color = Theme.of(context).primaryColor;
  var _size = 3.0;
  final _points = <_Point?>[];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        appBarTheme: themeData.appBarTheme.copyWith(color: tertiaryColor),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Slider(
              value: _size,
              onChanged: (value) => setState(() => _size = value),
              min: 1,
              max: 20,
            ),
            IconButton(
              onPressed: () => setState(() => _points.clear()),
              icon: const Icon(Icons.close),
            ),
            IconButton(
              onPressed: () => _color = Theme.of(context).primaryColor,
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _color = Colors.white,
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        body: GestureDetector(
          onPanDown: (details) => _drawPoint(details),
          onPanUpdate: (details) => _drawPoint(details),
          onPanEnd: (details) {
            setState(() => _points.add(null));
          },
          child: SizedBox.expand(
            child: CustomPaint(
              painter: _Painter(points: _points),
            ),
          ),
        ),
      ),
    );
  }

  void _drawPoint(details) {
    setState(() => _points.add(
          _Point(
            paint: Paint()
              ..isAntiAlias = true
              ..color = _color
              ..strokeWidth = _size
              ..strokeCap = StrokeCap.round,
            offset: details.localPosition,
          ),
        ));
  }
}

class _Painter extends CustomPainter {
  List<_Point?> points;

  _Painter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint()..color = Colors.white;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);
    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(
          points[x]!.offset,
          points[x + 1]!.offset,
          points[x]!.paint,
        );
      } else if (points[x] != null && points[x + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          [points[x]!.offset],
          points[x]!.paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return true;
  }
}

class _Point {
  final Paint paint;
  final Offset offset;

  _Point({
    required this.paint,
    required this.offset,
  });
}
