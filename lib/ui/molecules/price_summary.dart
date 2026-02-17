// lib/ui/molecules/price_summary.dart
import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow("Base Fare", "Rp 120.000"),
        _buildRow("Service Tax (11%)", "Rp 13.200"),
        _buildRow("Promo Discount", "- Rp 0", color: const Color(0xFF0D9488)),
        const Divider(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text("Rp 133.200", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0D9488))),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(value, style: TextStyle(color: color ?? Colors.black87, fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}