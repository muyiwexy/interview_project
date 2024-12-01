import 'package:flutter/material.dart';

class RectangularTabIndicator extends Decoration {
  final Color color;
  final double height;

  const RectangularTabIndicator({required this.color, this.height = 5.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RectangularPainter(color: color, height: height);
  }
}

class _RectangularPainter extends BoxPainter {
  final Color color;
  final double height;

  _RectangularPainter({required this.color, required this.height});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    final double width = (configuration.size!.width + 20);
    final double left = offset.dx - 10;
    final double bottom = (configuration.size?.height ?? 0);

    Rect rect = Rect.fromLTWH(left, bottom - height, width, height);
    canvas.drawRect(rect, paint);
  }
}
