import 'package:flutter/material.dart';
import '../../pages/ticket/seat_selection_page.dart'; // Pastikan import halaman seat selection

class BusCard extends StatelessWidget {
  final String name;
  final String type;
  final String rating;
  final String depTime;
  final String arrTime;
  final String price;
  final List<IconData> facilities;

  const BusCard({
    super.key,
    required this.name,
    required this.type,
    required this.rating,
    required this.depTime,
    required this.arrTime,
    required this.price,
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header: Nama Bus & Tipe
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFE0F2F1),
                    child: Icon(Icons.directions_bus, size: 20, color: Color(0xFF0D9488)),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 14),
                          Text(" $rating", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F2F1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type,
                  style: const TextStyle(color: Color(0xFF0D9488), fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Body: Waktu & Durasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _timeColumn(depTime, "JKT"),
              Expanded(
                child: Column(
                  children: [
                    const Text("3h 20m", style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Row(
                      children: [
                        const Icon(Icons.radio_button_checked, size: 10, color: Color(0xFF0D9488)),
                        Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
                        const Icon(Icons.directions_bus, size: 14, color: Color(0xFF0D9488)),
                        Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
                        const Icon(Icons.location_on, size: 10, color: Colors.grey),
                      ],
                    ),
                    const Text("Direct", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
              _timeColumn(arrTime, "BDG"),
            ],
          ),
          const SizedBox(height: 20),
          
          // Footer: Fasilitas & Harga
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: facilities.map((icon) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(icon, size: 16, color: Colors.grey),
                )).toList(),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0D9488)),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // NAVIGASI: Ke Halaman Pemilihan Kursi
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeatSelectionPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2DD4BF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: const Text("Select", style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String time, String city) {
    return Column(
      children: [
        Text(time, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(city, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}