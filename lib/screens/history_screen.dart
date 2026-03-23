import 'package:flutter/material.dart';
import 'history_detail_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {'title': 'Transfer - Andi', 'date': '23 Mar 2026', 'amount': 'Rp 100.000', 'type': 'Debit'},
      {'title': 'Top Up DANA', 'date': '22 Mar 2026', 'amount': 'Rp 50.000', 'type': 'Debit'},
      {'title': 'Pulsa Telkomsel', 'date': '21 Mar 2026', 'amount': 'Rp 25.000', 'type': 'Debit'},
      {'title': 'Transfer Masuk', 'date': '20 Mar 2026', 'amount': 'Rp 1.000.000', 'type': 'Kredit'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Riwayat Transaksi', style: TextStyle(color: Color(0xFF00529C))),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildFilterSection(),
          Expanded(
            child: ListView.separated(
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return ListTile(
                  title: Text(tx['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(tx['date']),
                  trailing: Text(
                    tx['amount'],
                    style: TextStyle(
                      color: tx['type'] == 'Kredit' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryDetailScreen(transaction: tx),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.grey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Semua Transaksi', style: TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.calendar_today, size: 20, color: Color(0xFF00529C)),
        ],
      ),
    );
  }
}
