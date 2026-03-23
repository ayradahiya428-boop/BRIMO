import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;
  const HistoryDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFE3F2FD),
              child: Icon(Icons.receipt_long, color: Color(0xFF00529C), size: 30),
            ),
            const SizedBox(height: 16),
            Text(
              transaction['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            _buildDetailRow('Tanggal', transaction['date']),
            const Divider(height: 32),
            _buildDetailRow('Status', 'Berhasil', valueColor: Colors.green),
            const Divider(height: 32),
            _buildDetailRow('Nominal', transaction['amount'], isBold: true),
            const Divider(height: 32),
            _buildDetailRow('ID Referensi', 'REF${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF00529C)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Tutup', style: TextStyle(color: Color(0xFF00529C), fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }
}
