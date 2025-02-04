import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color color;

  const AppLogo({
    Key? key,
    this.size = 120,
    this.color = Colors.teal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: LogoPainter(color: color),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  final Color color;

  LogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08
      ..strokeCap = StrokeCap.round;

    // Draw the glove outline
    final path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.2)
      ..lineTo(size.width * 0.3, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.8,
        size.width * 0.5,
        size.height * 0.8,
      )
      ..quadraticBezierTo(
        size.width * 0.7,
        size.height * 0.8,
        size.width * 0.7,
        size.height * 0.6,
      )
      ..lineTo(size.width * 0.7, size.height * 0.2);

    canvas.drawPath(path, paint);

    // Draw fingers
    for (var i = 0; i < 4; i++) {
      final x = size.width * (0.4 + i * 0.1);
      final fingerPath = Path()
        ..moveTo(x, size.height * 0.2)
        ..lineTo(x, size.height * 0.1);
      canvas.drawPath(fingerPath, paint);
    }

    // Draw thumb
    final thumbPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.4)
      ..lineTo(size.width * 0.2, size.height * 0.3);
    canvas.drawPath(thumbPath, paint);

    // Draw sparkles
    final sparklePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    void drawSparkle(double x, double y) {
      canvas.drawCircle(
        Offset(x * size.width, y * size.height),
        size.width * 0.03,
        sparklePaint,
      );
    }

    drawSparkle(0.8, 0.2);
    drawSparkle(0.9, 0.3);
    drawSparkle(0.85, 0.4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 