import 'package:flutter/material.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Rekening'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummary(),
            const Divider(height: 1),
            _buildDetailList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      child: Column(
        children: [
          const Text('Saldo Tersedia', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          const Text(
            'Rp 969.000.000',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF00529C)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(20)),
            child: const Text('Tabungan Utama - 0123456789', style: TextStyle(color: Color(0xFF00529C))),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailList() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Informasi Rekening', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 20),
          _infoRow('Status Rekening', 'Aktif', color: Colors.green),
          _infoRow('Kantor Cabang', 'KCP Jakarta Sudirman'),
          _infoRow('Mata Uang', 'IDR (Indonesian Rupiah)'),
          _infoRow('Limit Harian', 'Rp 1.000.000.000'),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color ?? Colors.black87)),
        ],
      ),
    );
  }
}
