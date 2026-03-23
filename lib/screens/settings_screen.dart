import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
            trailing: Text('Indonesia', style: TextStyle(color: Colors.grey)),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Pemberitahuan'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Tentang Aplikasi'),
            trailing: Text('v1.0.0'),
          ),
        ],
      ),
    );
  }
}
