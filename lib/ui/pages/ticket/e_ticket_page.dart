import 'package:flutter/material.dart';
import '../../atoms/ticket/ticket_info_item.dart';
import '../../molecules/ticket/dashed_line_painter.dart';

class ETicketPage extends StatelessWidget {
  const ETicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20), onPressed: () => Navigator.pop(context)),
        title: const Text("Your E-Ticket", style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Container Tiket Utama
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  // Bagian Atas Tiket
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: const Color(0xFF2DD4BF), borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(Icons.directions_bus, color: Colors.white, size: 20),
                                ),
                                const SizedBox(width: 12),
                                const Text("TravelKuy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(color: const Color(0xFFCCFBF1), borderRadius: BorderRadius.circular(20)),
                              child: const Text("ACTIVE", style: TextStyle(color: Color(0xFF0D9488), fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Rute
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCityColumn("Jakarta", "Terminal Pulo Gebang"),
                            const Icon(Icons.arrow_forward, color: Color(0xFF2DD4BF)),
                            _buildCityColumn("Bandung", "Terminal Leuwi Panjang", alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Info Detail Row 1
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TicketInfoItem(label: "Passenger Name", value: "John Doe"),
                            TicketInfoItem(label: "Bus Name", value: "KuyExpress", alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Info Detail Row 2
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TicketInfoItem(label: "Departure Time", value: "10 Oct • 08:30 AM"),
                            TicketInfoItem(label: "Seat Number", value: "12A", alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Info Detail Row 3
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TicketInfoItem(label: "Boarding Gate", value: "B3"),
                            TicketInfoItem(label: "Class", value: "First Class", alignment: CrossAxisAlignment.end),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Efek Potongan Tiket (Garis Putus)
                  CustomPaint(size: const Size(double.infinity, 1), painter: DashedLinePainter()),
                  
                  // Bagian QR Code
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=TravelKuy-JohnDoe-12A",
                            height: 150,
                            width: 150,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text("TK-7721-8890-21", style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Tombol Aksi
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded),
                label: const Text("Download PDF"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2DD4BF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today_outlined),
                label: const Text("Add to Calendar"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1E293B),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityColumn(String city, String terminal, {CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(city, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(terminal, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}