import 'package:flutter/material.dart';
import '../organisms/booking_card.dart';
import '../molecules/special_offer_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning,", style: TextStyle(color: Colors.grey)),
                      Text("Hello, Alex! 👋",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal.shade100,
                        child:
                            const Icon(Icons.person, color: Color(0xFF0D9488)),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          constraints: const BoxConstraints(
                              minWidth: 12, minHeight: 12),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),

              // 2. Booking Bus Card
              const BookingCard(),

              const SizedBox(height: 32),

              // 3. Special Offers Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Special Offers",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All",
                        style: TextStyle(color: Color(0xFF0D9488))),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: [
                    SpecialOfferCard(),
                    SizedBox(width: 16),
                    SpecialOfferCard(),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 4. Popular Routes Section
              const Text(
                "Popular Routes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  _buildRouteCard("Jakarta ➔ Bandung", "Start from Rp 120k",
                      "assets/images/jkt_bdg.png", true),
                  _buildRouteCard("Surabaya ➔ Malang", "Start from Rp 85k",
                      "assets/images/sby_mlg.png", false),
                  _buildRouteCard("Jogja ➔ Bali", "Start from Rp 350k",
                      "assets/images/jg_bali.png", false),
                  _buildRouteCard("Medan ➔ Lake Toba", "Start from Rp 150k",
                      "assets/images/mdn_toba.png", false),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // 5. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0D9488),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number_outlined),
              label: 'My Tickets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }

  // Helper widget untuk Route Card dengan integrasi gambar
  Widget _buildRouteCard(
      String title, String price, String imagePath, bool isTopChoice) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.teal.shade50,
                // Memanggil gambar aset
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: isTopChoice
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Top Choice",
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF0D9488),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(price,
                    style: const TextStyle(
                        color: Color(0xFF0D9488),
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ],
      ),
    );
  }
}