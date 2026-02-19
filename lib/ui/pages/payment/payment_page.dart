import 'package:flutter/material.dart';
import 'package:travelkuy/ui/atoms/ticket/ticket_info_item.dart';
import 'package:travelkuy/ui/atoms/primary_button.dart';
import 'package:travelkuy/ui/molecules/ticket/dashed_line_painter.dart';

class ETicketPage extends StatelessWidget {
  const ETicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Your E-Ticket", 
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  // Info Perjalanan
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("TravelKuy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(color: const Color(0xFFCCFBF1), borderRadius: BorderRadius.circular(20)),
                              child: const Text("ACTIVE", style: TextStyle(color: Color(0xFF0D9488), fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TicketInfoItem(label: "Passenger", value: "Nova Aulia"),
                            TicketInfoItem(label: "Seat", value: "12A", alignment: CrossAxisAlignment.end),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Garis Putus-putus
                  CustomPaint(size: const Size(double.infinity, 1), painter: DashedLinePainter()),
                  
                  // QR Code Section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=TravelKuy-Nova",
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text("TK-2026-X12B", style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Tombol Selesai untuk kembali ke Beranda
            PrimaryButton(
              label: "Done",
              onPressed: () {
                // Menghapus semua history navigasi dan kembali ke halaman pertama (Home)
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}