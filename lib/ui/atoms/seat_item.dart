// lib/ui/atoms/seat_item.dart
import 'package:flutter/material.dart';

enum SeatStatus { avail, selected, booked, female }

class SeatItem extends StatelessWidget {
  final String label;
  final SeatStatus status;
  final VoidCallback onTap;

  const SeatItem({
    super.key,
    required this.label,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor = Colors.black87;

    switch (status) {
      case SeatStatus.selected:
        bgColor = const Color(0xFF0D9488);
        textColor = Colors.white;
        break;
      case SeatStatus.booked:
        bgColor = const Color(0xFFE2E8F0);
        break;
      case SeatStatus.female:
        bgColor = const Color(0xFFFDA4AF);
        break;
      default:
        bgColor = Colors.white;
    }

    return GestureDetector(
      onTap: status == SeatStatus.booked ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: status == SeatStatus.avail ? Colors.grey.shade300 : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}