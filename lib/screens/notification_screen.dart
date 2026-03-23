import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Promo Hemat Transfer',
        'desc': 'Nikmati bebas biaya admin transfer ke bank lain hari ini!',
        'time': '10:30',
        'isRead': false,
        'icon': Icons.local_offer,
      },
      {
        'title': 'Transaksi Berhasil',
        'desc': 'Transfer ke Andi sebesar Rp 100.000 telah berhasil.',
        'time': 'Kemarin',
        'isRead': true,
        'icon': Icons.swap_horiz,
      },
      {
        'title': 'Keamanan Akun',
        'desc': 'Jangan pernah memberikan PIN atau OTP Anda kepada siapapun.',
        'time': '22 Mar',
        'isRead': true,
        'icon': Icons.security,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifikasi', style: TextStyle(color: Color(0xFF00529C))),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFF0F7FF),
              child: Icon(notif['icon'], color: const Color(0xFF00529C), size: 20),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(notif['title'], style: TextStyle(fontWeight: notif['isRead'] ? FontWeight.normal : FontWeight.bold)),
                if (!notif['isRead'])
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                  ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(notif['desc'], maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(notif['time'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            onTap: () {
              _showDetail(context, notif);
            },
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, Map<String, dynamic> notif) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notif['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(notif['desc']),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00529C)),
                child: const Text('Tutup', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
