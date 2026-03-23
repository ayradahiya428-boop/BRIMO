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
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  children: [
                    _buildStatusHeader(),
                    const SizedBox(height: 32),
                    _buildReceiptCard(),
                    const SizedBox(height: 24),
                    _buildShareButton(),
                  ],
                ),
              ),
            ),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 48),
        ),
        const SizedBox(height: 16),
        const Text(
          'Transaksi Berhasil!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00529C),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          DateTime.now().toString().substring(0, 16),
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildReceiptCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Total Transfer',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp $amount',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00529C),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildReceiptRow('Bank Tujuan', bankType == 'BRI' ? 'BRI' : 'Bank Lain'),
                const SizedBox(height: 16),
                _buildReceiptRow('Nomor Rekening', accountNumber),
                const SizedBox(height: 16),
                _buildReceiptRow('Nama Penerima', 'BRImo User Receiver'),
                const SizedBox(height: 16),
                _buildReceiptRow('Catatan', notes.isEmpty ? '-' : notes),
                const SizedBox(height: 16),
                _buildReceiptRow('ID Transaksi', 'TRX${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'),
              ],
            ),
          ),
          _buildDashedLine(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Simpan resi ini sebagai bukti transaksi yang sah.',
              style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return Row(
      children: List.generate(
        30,
        (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 1,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }

  Widget _buildShareButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.share, size: 20),
      label: const Text('Bagikan Resi'),
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF00529C),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00529C),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text(
              'Kembali ke Beranda',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
