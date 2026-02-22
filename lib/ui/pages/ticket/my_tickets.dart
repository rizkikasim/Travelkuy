import 'package:flutter/material.dart';
import 'package:travelkuy/ui/pages/ticket/e_ticket_page.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi warna utama TravelKuy
    const Color primaryColor = Color(0xFF0D968B);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "My Tickets",
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Tiket 1: Aktif
          _buildTicketCard(
            context,
            destination: "Jakarta ➔ Bandung",
            date: "10 Oct 2023 • 08:30 AM",
            busName: "KuyExpress",
            status: "ACTIVE",
            statusColor: primaryColor,
          ),
          
          const SizedBox(height: 16),

          // Tiket 2: Selesai/Past Trip
          _buildTicketCard(
            context,
            destination: "Surabaya ➔ Malang",
            date: "15 Sep 2023 • 10:00 AM",
            busName: "Pahala Kencana",
            status: "COMPLETED",
            statusColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCard(
    BuildContext context, {
    required String destination,
    required String date,
    required String busName,
    required String status,
    required Color statusColor,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke E-Ticket Detail
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ETicketPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFF1F5F9),
                  child: Icon(Icons.directions_bus, color: Color(0xFF0D968B)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        busName,
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Text(
                  "Details →",
                  style: TextStyle(
                    color: Color(0xFF0D968B),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}