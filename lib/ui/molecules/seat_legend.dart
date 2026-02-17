// lib/ui/molecules/seat_legend.dart
import 'package:flutter/material.dart';

class SeatLegend extends StatelessWidget {
  const SeatLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildLegendItem("AVAIL", Colors.white, Colors.grey.shade300),
          _buildLegendItem("SELECTED", const Color(0xFF0D9488), Colors.transparent),
          _buildLegendItem("BOOKED", const Color(0xFFE2E8F0), Colors.transparent),
          _buildLegendItem("FEMALE", const Color(0xFFFDA4AF), Colors.transparent),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color, Color borderColor) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
      ],
    );
  }
}