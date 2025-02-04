import 'package:flutter/material.dart';

class WelcomeIllustration extends StatelessWidget {
  final double size;

  const WelcomeIllustration({Key? key, this.size = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: WelcomePainter(),
      ),
    );
  }
}

class BookingIllustration extends StatelessWidget {
  final double size;

  const BookingIllustration({Key? key, this.size = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: BookingPainter(),
      ),
    );
  }
}

class TrackingIllustration extends StatelessWidget {
  final double size;

  const TrackingIllustration({Key? key, this.size = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: TrackingPainter(),
      ),
    );
  }
}

class WelcomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02
      ..strokeCap = StrokeCap.round;

    // Draw a house outline
    final housePath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.3)
      ..lineTo(size.width * 0.5, size.height * 0.1)
      ..lineTo(size.width * 0.8, size.height * 0.3)
      ..lineTo(size.width * 0.8, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.6);

    // Draw a door
    final doorPath = Path()
      ..moveTo(size.width * 0.4, size.height * 0.6)
      ..lineTo(size.width * 0.4, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.6);

    // Draw windows
    final window1Path = Path()
      ..addRect(Rect.fromLTWH(
        size.width * 0.6,
        size.height * 0.4,
        size.width * 0.1,
        size.height * 0.1,
      ));

    canvas.drawPath(housePath, paint);
    canvas.drawPath(doorPath, paint);
    canvas.drawPath(window1Path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BookingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02
      ..strokeCap = StrokeCap.round;

    // Draw a calendar outline
    final calendarPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.2,
          size.height * 0.2,
          size.width * 0.6,
          size.height * 0.6,
        ),
        Radius.circular(size.width * 0.05),
      ));

    // Draw calendar lines
    for (var i = 1; i < 4; i++) {
      final y = size.height * (0.2 + i * 0.15);
      canvas.drawLine(
        Offset(size.width * 0.25, y),
        Offset(size.width * 0.75, y),
        paint,
      );
    }

    canvas.drawPath(calendarPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrackingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02
      ..strokeCap = StrokeCap.round;

    // Draw a progress tracker
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.5),
      Offset(size.width * 0.8, size.height * 0.5),
      paint,
    );

    // Draw checkpoints
    for (var i = 0; i < 3; i++) {
      final x = size.width * (0.2 + i * 0.3);
      canvas.drawCircle(
        Offset(x, size.height * 0.5),
        size.width * 0.05,
        paint,
      );
    }

    // Draw status lines
    for (var i = 0; i < 3; i++) {
      final x = size.width * (0.2 + i * 0.3);
      canvas.drawLine(
        Offset(x, size.height * 0.4),
        Offset(x, size.height * 0.6),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 