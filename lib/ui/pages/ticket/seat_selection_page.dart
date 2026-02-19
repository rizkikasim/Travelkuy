import 'package:flutter/material.dart';
import '../../atoms/ticket/seat_item.dart';
import '../../atoms/ticket/primary_button.dart'; // Sesuaikan path jika bergeser
import '../../molecules/ticket/seat_legend.dart';
// Gunakan salah satu saja, saya sarankan package import agar lebih stabil
import 'package:travelkuy/ui/pages/payment/payment_page.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  // Simulasi data kursi yang dipilih secara default
  List<String> selectedSeats = ["2B", "6A"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          children: [
            Text(
              "Select Seat",
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Jakarta ➔ Bandung",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SeatLegend(),
          ),
          const SizedBox(height: 20),
          const Text(
            "FRONT OF BUS",
            style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 2),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.airline_seat_recline_extra, color: Colors.grey),
                Icon(Icons.door_front_door, color: Colors.grey),
              ],
            ),
          ),
          // Bus Seat Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemCount: 28,
              itemBuilder: (context, index) {
                int row = (index ~/ 4) + 1;
                int colIndex = index % 4;
                String colLabel = String.fromCharCode(65 + colIndex);
                String seatId = "$row$colLabel";

                SeatStatus status = SeatStatus.avail;
                if (selectedSeats.contains(seatId)) {
                  status = SeatStatus.selected;
                } else if (seatId == "1A" || seatId == "3C" || seatId == "3D" || seatId == "5D") {
                  status = SeatStatus.booked;
                } else if (seatId == "2C" || seatId == "2D") {
                  status = SeatStatus.female;
                }

                return SeatItem(
                  label: seatId,
                  status: status,
                  onTap: () {
                    setState(() {
                      if (selectedSeats.contains(seatId)) {
                        selectedSeats.remove(seatId);
                      } else {
                        selectedSeats.add(seatId);
                      }
                    });
                  },
                );
              },
            ),
          ),
          _buildBottomSummary(),
        ],
      ),
    );
  }

  Widget _buildBottomSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "YOUR SELECTION",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: selectedSeats.isEmpty
                        ? [const Text("-", style: TextStyle(color: Colors.grey))]
                        : selectedSeats
                            .map((s) => Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFE0F2F1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Seat $s",
                                    style: const TextStyle(
                                        color: Color(0xFF0D9488),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "TOTAL PRICE",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Rp ${selectedSeats.length * 150000}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D9488)),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: "Continue to Payment →",
            onPressed: () {
              if (selectedSeats.isNotEmpty) {
                Navigator.push(
                  context,
                  // BAGIAN FIX: Hapus keyword 'const' di depan PaymentPage()
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please select a seat first")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}