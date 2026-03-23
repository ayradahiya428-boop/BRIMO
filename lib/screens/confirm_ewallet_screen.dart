import 'package:flutter/material.dart';
import 'success_screen.dart';

class ConfirmEWalletScreen extends StatelessWidget {
  final String walletName;
  final String phoneNumber;
  final String amount;

  const ConfirmEWalletScreen({
    super.key,
    required this.walletName,
    required this.phoneNumber,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Konfirmasi Top Up'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Pembayaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailCard(),
                ],
              ),
            ),
          ),
          _buildBottomAction(context),
        ],
      ),
    );
  }

  Widget _buildDetailCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          _buildRow('Produk', walletName),
          const Divider(height: 30),
          _buildRow('Nomor HP', phoneNumber),
          const Divider(height: 30),
          _buildRow('Nama Pelanggan', 'BRImo User'),
          const Divider(height: 30),
          _buildRow('Nominal', 'Rp $amount', isBold: true, valueColor: const Color(0xFF00529C)),
          const Divider(height: 30),
          _buildRow('Biaya Admin', 'Rp 1.000'),
          const Divider(height: 30),
          _buildRow('Total Bayar', 'Rp $amount', isBold: true, valueColor: const Color(0xFF00529C)),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
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

  Widget _buildBottomAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessScreen(
                    bankType: 'E-Wallet',
                    accountNumber: phoneNumber,
                    amount: amount,
                    notes: 'Top Up $walletName',
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00529C),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'Top Up Sekarang',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
