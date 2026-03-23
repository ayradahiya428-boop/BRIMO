import 'package:flutter/material.dart';
import 'confirm_ewallet_screen.dart';

class EWalletScreen extends StatefulWidget {
  const EWalletScreen({super.key});

  @override
  State<EWalletScreen> createState() => _EWalletScreenState();
}

class _EWalletScreenState extends State<EWalletScreen> {
  final _phoneController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedWallet = 'DANA'; // Default

  final List<Map<String, String>> _wallets = [
    {'name': 'DANA', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Logo_dana_blue.svg/1200px-Logo_dana_blue.svg.png'},
    {'name': 'OVO', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Logo_ovo_purple.svg/1200px-Logo_ovo_purple.svg.png'},
    {'name': 'GoPay', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Gopay_logo.svg/1200px-Gopay_logo.svg.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Top Up E-Wallet'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Dompet Digital',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildWalletSelector(),
            const SizedBox(height: 24),
            _buildInputField(
              label: 'Nomor Handphone',
              controller: _phoneController,
              hint: 'Contoh: 0812XXXXXXXX',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              label: 'Nominal Top Up',
              controller: _amountController,
              hint: 'Rp 0',
              keyboardType: TextInputType.number,
              prefix: const Text('Rp ', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmEWalletScreen(
                        walletName: _selectedWallet,
                        phoneNumber: _phoneController.text,
                        amount: _amountController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00529C),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Lanjutkan',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletSelector() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _wallets.length,
        itemBuilder: (context, index) {
          final wallet = _wallets[index];
          final isSelected = _selectedWallet == wallet['name'];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedWallet = wallet['name']!;
              });
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? const Color(0xFF00529C) : Colors.transparent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(
                    Icons.account_balance_wallet_outlined,
                    color: isSelected ? const Color(0xFF00529C) : Colors.grey,
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wallet['name']!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? const Color(0xFF00529C) : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
    Widget? prefix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefix: prefix,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}
