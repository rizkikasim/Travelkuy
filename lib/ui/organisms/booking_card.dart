import 'package:flutter/material.dart';
import '../atoms/booking_input_field.dart';
import '../atoms/primary_button.dart';
import '../molecules/trip_type_selector.dart';
import '../pages/search_result_page.dart'; // Pastikan import ini ada

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("BOOK BUS",
                  style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              TripTypeSelector(),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Column(
                children: [
                  BookingInputField(
                      icon: Icons.location_on,
                      label: "FROM",
                      value: "Jakarta (JKT)"),
                  SizedBox(height: 12),
                  BookingInputField(
                      icon: Icons.near_me, label: "TO", value: "Bandung (BDG)"),
                ],
              ),
              Positioned(
                right: 20,
                top: 35,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Color(0xFF0D9488), shape: BoxShape.circle),
                  child: const Icon(Icons.swap_vert, color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                  child: BookingInputField(
                      icon: Icons.calendar_today,
                      label: "DEPARTURE DATE",
                      value: "24 Oct, 2023")),
              SizedBox(width: 12),
              Expanded(
                  child: BookingInputField(
                      icon: Icons.person, label: "PASSENGERS", value: "2 Adult")),
            ],
          ),
          const SizedBox(height: 24),
          // Bagian tombol Search yang sudah ditambahkan navigasi
          PrimaryButton(
            label: "Search Journey",
            onPressed: () {
              // Menjalankan navigasi ke halaman SearchResultPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchResultPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}