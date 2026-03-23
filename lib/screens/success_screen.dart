import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String bankType;
  final String accountNumber;
  final String amount;
  final String notes;

  const SuccessScreen({
    super.key,
    required this.bankType,
    required this.accountNumber,
    required this.amount,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Transaksi Berhasil!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00529C),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildDetailBox(),
                  ],
                ),
              ),
            ),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          _buildRow('Bank Tujuan', bankType == 'BRI' ? 'BRI' : 'Bank Lain'),
          const Divider(height: 24),
          _buildRow('Nomor Rekening', accountNumber),
          const Divider(height: 24),
          _buildRow('Nama Penerima', 'BRImo User Receiver'),
          const Divider(height: 24),
          _buildRow('Nominal', 'Rp $amount', valueColor: const Color(0xFF00529C), isBold: true),
          const Divider(height: 24),
          _buildRow('Catatan', notes.isEmpty ? '-' : notes),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {Color? valueColor, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Kembali ke Home Dashboard
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00529C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Selesai',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
