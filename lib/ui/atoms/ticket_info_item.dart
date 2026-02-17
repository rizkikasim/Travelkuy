// lib/ui/atoms/ticket_info_item.dart
import 'package:flutter/material.dart';

class TicketInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment alignment;

  const TicketInfoItem({
    super.key,
    required this.label,
    required this.value,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(color: Color(0xFF1E293B), fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}