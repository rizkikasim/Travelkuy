import 'package:flutter/material.dart';
import '../organisms/booking_card.dart';
import '../molecules/home/special_offer_card.dart';
import '../molecules/home/route_card.dart'; 

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
              _buildHeader(),

              const SizedBox(height: 30),

              // 2. Booking Bus Card (Organism)
              const BookingCard(),

              const SizedBox(height: 32),

              // 3. Special Offers Section
              _buildSectionHeader("Special Offers", () {}),
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
              
              // Grid view menggunakan RouteCard Molecule
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75, 
                children: const [
                  RouteCard(
                    routeName: "Jakarta to Bandung",
                    price: "Rp 120k",
                    // FIX: Menggunakan tanda kutip untuk path aset
                    imageUrl: "assets/images/route/Beach.png",
                    isTopChoice: true,
                  ),
                  RouteCard(
                    routeName: "Surabaya to Malang",
                    price: "Rp 85k",
                    imageUrl: "assets/images/route/Cityscape.png",
                  ),
                  RouteCard(
                    routeName: "Jogja to Bali",
                    price: "Rp 350k",
                    imageUrl: "assets/images/route/Landscape.png",
                  ),
                  RouteCard(
                    routeName: "Medan to Lake Toba",
                    price: "Rp 150k",
                    imageUrl: "assets/images/route/Nature.png",
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      
      // 5. Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- Helper Widgets untuk Header & Nav ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning,", style: TextStyle(color: Colors.grey)),
            Text("Hello, Rizki! 👋", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.teal.shade100,
              child: const Icon(Icons.person, color: Color(0xFF0D9488)),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                constraints: const BoxConstraints(minWidth: 12, minHeight: 12),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onSeeAll,
          child: const Text("See All", style: TextStyle(color: Color(0xFF0D9488))),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF0D9488),
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), label: 'My Tickets'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
      ],
    );
  }
}