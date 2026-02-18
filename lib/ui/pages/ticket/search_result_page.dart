import 'package:flutter/material.dart';
import '../../../molecules/bus_card.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: const Column(
          children: [
            Text("Jakarta ➔ Bandung", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Wed, 24 Oct • 2 Adults", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined, color: Color(0xFF0D9488)), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("12 Buses Found", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text("Sorted by: Lowest Price", style: TextStyle(fontSize: 12, color: Color(0xFF0D9488))),
                    label: const Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF0D9488)),
                  ),
                ],
              ),
              const BusCard(name: "Pahala Kencana", type: "EXECUTIVE", rating: "4.8", depTime: "08:00", arrTime: "11:20", price: "Rp 150.000", facilities: [Icons.wifi, Icons.ac_unit, Icons.power]),
              const BusCard(name: "Rosalia Indah", type: "SLEEPER", rating: "4.9", depTime: "10:30", arrTime: "14:15", price: "Rp 210.000", facilities: [Icons.wifi, Icons.ac_unit, Icons.chair_alt]),
              const BusCard(name: "Sinar Jaya", type: "ECONOMY", rating: "4.5", depTime: "13:00", arrTime: "16:10", price: "Rp 120.000", facilities: [Icons.ac_unit, Icons.power]),
              const BusCard(name: "Kramat Djati", type: "BUSINESS", rating: "4.6", depTime: "15:45", arrTime: "19:15", price: "Rp 165.000", facilities: [Icons.wifi, Icons.ac_unit]),
              const SizedBox(height: 80),
            ],
          ),
          // Floating Filter Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.tune),
                label: const Text("Filter & Sort"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}