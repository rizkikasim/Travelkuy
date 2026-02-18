import 'package:flutter/material.dart';
import '../../../atoms/primary_button.dart';
import '../../../atoms/payment_method_tile.dart';
import '../../../molecules/price_summary.dart';
import 'e_ticket_page.dart'; 

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // State untuk melacak metode pembayaran yang dipilih
  String selectedMethod = 'GoPay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Secure Checkout",
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Trip Summary Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TRIP SUMMARY",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D9488),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Jakarta to Bandung",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const Text(
                          "Arrives Oct 24, 2023 • 09:00 AM",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Icon(Icons.person_outline, size: 14, color: Color(0xFF0D9488)),
                            SizedBox(width: 4),
                            Text(
                              "1 Passenger (Seat 12A)",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.directions_bus, size: 40, color: Color(0xFF0D9488)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 2. Express Checkout
            const Text(
              "Express Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 11),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone_iphone, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text("Pay", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // 3. Other Payment Methods
            const Text(
              "Other Payment Methods",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text(
              "DIGITAL WALLETS",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 10),
            ),
            const SizedBox(height: 12),
            PaymentMethodTile(
              label: "GoPay",
              icon: Image.network("https://api.iconify.design/logos:gopay.svg", width: 20, errorBuilder: (c, e, s) => const Icon(Icons.wallet)),
              isSelected: selectedMethod == 'GoPay',
              onTap: () => setState(() => selectedMethod = 'GoPay'),
            ),
            PaymentMethodTile(
              label: "OVO",
              icon: const Icon(Icons.wallet, color: Colors.deepPurple, size: 20),
              isSelected: selectedMethod == 'OVO',
              onTap: () => setState(() => selectedMethod = 'OVO'),
            ),

            const SizedBox(height: 16),
            const Text(
              "VIRTUAL ACCOUNT",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 10),
            ),
            const SizedBox(height: 12),
            PaymentMethodTile(
              label: "BCA Virtual Account",
              icon: const Icon(Icons.account_balance, size: 18, color: Color(0xFF0D9488)),
              isSelected: selectedMethod == 'BCA',
              onTap: () => setState(() => selectedMethod = 'BCA'),
            ),

            // 4. Grid Selection (Credit Card & QRIS)
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildGridPaymentItem(Icons.credit_card, "Credit Card"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGridPaymentItem(Icons.qr_code_scanner, "QRIS"),
                ),
              ],
            ),

            const SizedBox(height: 32),
            // 5. Promo Code Section
            const Text(
              "PROMO CODE",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 10),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter promo code",
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D9488),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Apply", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 6. Final Summary
            const PriceSummary(),
            const SizedBox(height: 40),

            // Tombol Bayar
            PrimaryButton(
              label: "Pay Now",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ETicketPage()),
                );
              },
            ),
            const SizedBox(height: 24),
            
            // Security Info
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_outline, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    "SSL ENCRYPTED & SECURE",
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper untuk widget berbentuk kotak (Credit Card/QRIS)
  Widget _buildGridPaymentItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF0D9488)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}