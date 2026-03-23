import 'package:flutter/material.dart';

class MoreMenuScreen extends StatelessWidget {
  const MoreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Favorit',
        'items': [
          {'icon': Icons.swap_horiz, 'label': 'Transfer'},
          {'icon': Icons.receipt_long, 'label': 'BRIVA'},
          {'icon': Icons.account_balance_wallet, 'label': 'E-Wallet'},
          {'icon': Icons.phone_android, 'label': 'Pulsa/Data'},
        ]
      },
      {
        'title': 'Tagihan',
        'items': [
          {'icon': Icons.electrical_services, 'label': 'Listrik'},
          {'icon': Icons.water, 'label': 'Air PDAM'},
          {'icon': Icons.tv, 'label': 'TV Kabel'},
          {'icon': Icons.security, 'label': 'BPJS'},
        ]
      },
      {
        'title': 'Top Up',
        'items': [
          {'icon': Icons.add_circle_outline, 'label': 'BRIZZI'},
          {'icon': Icons.stars, 'label': 'Voucher Game'},
        ]
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Semua Layanan', style: TextStyle(color: Color(0xFF00529C))),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: categories.length,
        itemBuilder: (context, idx) {
          final cat = categories[idx];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cat['title'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemCount: (cat['items'] as List).length,
                itemBuilder: (context, itemIdx) {
                  final item = cat['items'][itemIdx];
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF0F7FF),
                        child: Icon(item['icon'], color: const Color(0xFF00529C)),
                      ),
                      const SizedBox(height: 8),
                      Text(item['label'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}
