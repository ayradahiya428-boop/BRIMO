import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isFingerprintEnabled = false;
  String _selectedLanguage = 'Bahasa Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Pengaturan'),
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
                'Ketulusan dalam Pelayanan',
                style: TextStyle(color: Colors.white70, fontSize: 11, fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                _buildSectionHeader('Keamanan'),
                _buildCard([
                  _buildMenuItem(
                    icon: Icons.lock_outline,
                    title: 'Ganti Password',
                    onTap: () => _showChangePasswordModal(context),
                  ),
                  const Divider(height: 1, indent: 50),
                  _buildSwitchItem(
                    icon: Icons.fingerprint,
                    title: 'Login dengan Sidik Jari',
                    value: _isFingerprintEnabled,
                    onChanged: (val) {
                      setState(() {
                        _isFingerprintEnabled = val;
                      });
                    },
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionHeader('Preferensi'),
                _buildCard([
                  _buildMenuItem(
                    icon: Icons.language,
                    title: 'Bahasa Aplikasi',
                    trailingText: _selectedLanguage,
                    onTap: () => _showLanguageSelector(context),
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionHeader('Lainnya'),
                _buildCard([
                  _buildMenuItem(
                    icon: Icons.info_outline,
                    title: 'Informasi Aplikasi',
                    trailingText: 'v3.26.0 (Ramadan)',
                    onTap: () {},
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF00529C),
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF00529C), size: 22),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: const Color(0xFF00529C), size: 22),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF00529C),
    );
  }

  void _showChangePasswordModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24, right: 24, top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40, height: 4,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Ganti Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00529C))),
            const SizedBox(height: 24),
            _buildModalField('Password Lama', true),
            const SizedBox(height: 16),
            _buildModalField('Password Baru', true),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[800],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Simpan Perubahan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildModalField(String label, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[300]!)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200]!)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text('Pilih Bahasa Aplikasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00529C))),
          ),
          _buildLanguageItem('Bahasa Indonesia', _selectedLanguage == 'Bahasa Indonesia'),
          _buildLanguageItem('English', _selectedLanguage == 'English'),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String label, bool isSelected) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text(label, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? const Color(0xFF00529C) : Colors.black87)),
      trailing: isSelected ? const Icon(Icons.check_circle, color: Color(0xFF00529C)) : null,
      onTap: () {
        setState(() => _selectedLanguage = label);
        Navigator.pop(context);
      },
    );
  }
}
