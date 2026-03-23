import 'package:flutter/material.dart';
import 'history_detail_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {'title': 'Transfer - Andi', 'date': '23 Mar 2026', 'amount': 'Rp 100.000', 'type': 'Debit', 'category': 'Transfer'},
      {'title': 'Top Up DANA', 'date': '22 Mar 2026', 'amount': 'Rp 50.000', 'type': 'Debit', 'category': 'E-Wallet'},
      {'title': 'Pulsa Telkomsel', 'date': '21 Mar 2026', 'amount': 'Rp 25.000', 'type': 'Debit', 'category': 'Pulsa'},
      {'title': 'Transfer Masuk', 'date': '20 Mar 2026', 'amount': 'Rp 1.000.000', 'type': 'Kredit', 'category': 'Masuk'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Ramadan Slim Header
          Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF00529C),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Center(
              child: Text(
                'Rekam Jejak Kebaikan',
                style: TextStyle(color: Colors.white70, fontSize: 11, fontStyle: FontStyle.italic),
              ),
            ),
          ),
          _buildFilterSection(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: tx['type'] == 'Kredit' ? Colors.green.withOpacity(0.1) : const Color(0xFF00529C).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        tx['type'] == 'Kredit' ? Icons.south_west : Icons.north_east,
                        color: tx['type'] == 'Kredit' ? Colors.green : const Color(0xFF00529C),
                        size: 20,
                      ),
                    ),
                    title: Text(tx['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(tx['date'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${tx['type'] == 'Debit' ? '-' : '+'}${tx['amount']}',
                          style: TextStyle(
                            color: tx['type'] == 'Kredit' ? Colors.green : Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tx['type'],
                          style: TextStyle(
                            fontSize: 10,
                            color: tx['type'] == 'Kredit' ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryDetailScreen(transaction: tx),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bulan Ini',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00529C).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF00529C).withOpacity(0.1)),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Color(0xFF00529C)),
                const SizedBox(width: 8),
                Text(
                  'Maret 2026',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF00529C)),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF00529C)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
