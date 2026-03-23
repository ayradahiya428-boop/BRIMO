import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  'Berkah di Setiap Langkah',
                  style: TextStyle(color: Colors.white70, fontSize: 11, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 24),
            _buildMenuSection(context),
            const SizedBox(height: 40),
            Text(
              'v3.26.0 Ramadan Edition',
              style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFE2E8F0),
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Color(0xFF00529C),
                  child: Icon(Icons.person, color: Colors.white, size: 45),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                  child: const Icon(Icons.edit, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Irfan Mansyur',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF00529C)),
          ),
          const SizedBox(height: 4),
          Text(
            'Tabungan Utama • 0123456789',
            style: TextStyle(color: Colors.grey[500], fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.settings_outlined,
            label: 'Pengaturan',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
          ),
          const Divider(height: 1, indent: 60),
          _buildMenuItem(
            icon: Icons.security_outlined,
            label: 'Keamanan Akun',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 60),
          _buildMenuItem(
            icon: Icons.help_outline_outlined,
            label: 'Pusat Bantuan',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 60),
          _buildMenuItem(
            icon: Icons.logout,
            label: 'Keluar Dari Aplikasi',
            labelColor: Colors.redAccent,
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? labelColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (labelColor ?? const Color(0xFF00529C)).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: labelColor ?? const Color(0xFF00529C), size: 20),
      ),
      title: Text(
        label,
        style: TextStyle(color: labelColor, fontSize: 14, fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Konfirmasi Keluar', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Apakah Anda yakin ingin mengakhiri sesi BRImo Ramadan ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tunggu Dulu', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Ya, Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
