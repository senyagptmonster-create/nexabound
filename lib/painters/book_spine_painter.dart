import 'package:flutter/material.dart';

class BookSpinePainter extends CustomPainter {
  final int booksCount;

  const BookSpinePainter({required this.booksCount});

  @override
  void paint(Canvas canvas, Size size) {
    // Wooden library shelf plank
    final shelfPaint = Paint()
      ..color = const Color(0xFF3E2723)
      ..style = PaintingStyle.fill;
    final shelfRect = Rect.fromLTWH(0, size.height - 18, size.width, 18);
    canvas.drawRRect(RRect.fromRectAndRadius(shelfRect, const Radius.circular(4)), shelfPaint);

    final shelfLinePaint = Paint()
      ..color = const Color(0xFF5D4037)
      ..strokeWidth = 2.0;
    canvas.drawLine(Offset(0, size.height - 18), Offset(size.width, size.height - 18), shelfLinePaint);

    // Book spines standing on shelf
    final spineColors = [
      const Color(0xFF881337), // Crimson
      const Color(0xFF1E3A8A), // Navy
      const Color(0xFF064E3B), // Forest Green
      const Color(0xFF78350F), // Leather Brown
      const Color(0xFF4C1D95), // Deep Violet
      const Color(0xFF831843), // Burgundy
    ];

    const double spineWidth = 34.0;
    const double spacing = 10.0;
    final double startX = 20.0;

    for (int i = 0; i < booksCount.clamp(1, 6); i++) {
      final color = spineColors[i % spineColors.length];
      final double bookHeight = (size.height - 30) - (i % 3 * 12);
      final double left = startX + i * (spineWidth + spacing);
      final double top = (size.height - 18) - bookHeight;

      final bookRect = Rect.fromLTWH(left, top, spineWidth, bookHeight);
      final bookPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;
      canvas.drawRRect(RRect.fromRectAndRadius(bookRect, const Radius.circular(4)), bookPaint);

      // Gold spine ribs (embossed lines)
      final ribPaint = Paint()
        ..color = const Color(0xFFFBBF24).withValues(alpha: 0.6)
        ..strokeWidth = 1.5;
      canvas.drawLine(Offset(left + 3, top + 14), Offset(left + spineWidth - 3, top + 14), ribPaint);
      canvas.drawLine(Offset(left + 3, top + 18), Offset(left + spineWidth - 3, top + 18), ribPaint);
      canvas.drawLine(Offset(left + 3, top + bookHeight - 18), Offset(left + spineWidth - 3, top + bookHeight - 18), ribPaint);
      canvas.drawLine(Offset(left + 3, top + bookHeight - 14), Offset(left + spineWidth - 3, top + bookHeight - 14), ribPaint);

      // Ribbon bookmark hanging down
      if (i == 1) {
        final ribbonPaint = Paint()
          ..color = const Color(0xFFEF4444)
          ..strokeWidth = 3.0;
        canvas.drawLine(Offset(left + spineWidth / 2, top + bookHeight), Offset(left + spineWidth / 2, top + bookHeight + 12), ribbonPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant BookSpinePainter oldDelegate) {
    return oldDelegate.booksCount != booksCount;
  }
}
