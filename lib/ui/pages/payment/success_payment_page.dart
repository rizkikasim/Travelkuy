import 'package:flutter/material.dart';
// Gunakan package import agar aman setelah pindah folder
import 'package:travelkuy/ui/atoms/payment/success_icon.dart';
import 'package:travelkuy/ui/atoms/primary_button.dart';
import 'package:travelkuy/ui/molecules/payment/payment_detail_row.dart';
import 'package:travelkuy/ui/pages/ticket/e_ticket_page.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const SuccessIcon(),
              const SizedBox(height: 32),
              const Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Color(0xFF1E293B)
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Hooray! Your payment has been confirmed.\nYour ticket is now ready.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 40),
              
              // Card Rincian Transaksi
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: const [
                    PaymentDetailRow(label: "Transaction ID", value: "TRK-99210B"),
                    PaymentDetailRow(label: "Amount Paid", value: "Rp 133.200"),
                    PaymentDetailRow(label: "Payment Method", value: "GoPay"),
                  ],
                ),
              ),
              const Spacer(),
              
              // Tombol Utama: Lihat Tiket
              PrimaryButton(
                label: "View E-Ticket",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ETicketPage()),
                  );
                },
              ),
              const SizedBox(height: 16),
              
              // Tombol Sekunder: Kembali ke Home
              TextButton(
                onPressed: () {
                  // Menghapus tumpukan navigasi dan kembali ke HomePage
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                    color: Color(0xFF0D9488), 
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}