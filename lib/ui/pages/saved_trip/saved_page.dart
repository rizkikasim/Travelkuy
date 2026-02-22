import 'package:flutter/material.dart';
import '../../molecules/home/route_card.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna konsisten TravelKuy
    const Color primaryColor = Color(0xFF0D968B);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Saved Trips",
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(24),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
        children: const [
          // Contoh rute yang disimpan
          RouteCard(
            routeName: "Jakarta ➔ Bandung",
            price: "Rp 120k",
            imageUrl: "assets/images/route/Beach.png",
            isTopChoice: true,
          ),
          RouteCard(
            routeName: "Jogja ➔ Bali",
            price: "Rp 350k",
            imageUrl: "assets/images/route/Landscape.png",
          ),
        ],
      ),
    );
  }
}