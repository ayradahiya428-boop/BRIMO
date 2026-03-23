import 'package:flutter/material.dart';
import 'confirm_transfer_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  String _bankType = 'BRI'; // 'BRI' or 'Other'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Transfer'),
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
              'Tujuan Transfer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildBankSelection(),
            const SizedBox(height: 24),
            _buildInputField(
              label: 'Nomor Rekening',
              controller: _accountController,
              hint: 'Masukan nomor rekening',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              label: 'Nominal Transfer',
              controller: _amountController,
              hint: 'Rp 0',
              keyboardType: TextInputType.number,
              prefix: const Text('Rp ', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            _buildInputField(
              label: 'Catatan (Opsional)',
              controller: _notesController,
              hint: 'Tulis catatan di sini',
              maxLines: 2,
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
                      builder: (context) => ConfirmTransferScreen(
                        bankType: _bankType,
                        accountNumber: _accountController.text,
                        amount: _amountController.text,
                        notes: _notesController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00529C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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

  Widget _buildBankSelection() {
    return Row(
      children: [
        Expanded(
          child: _buildBankOption('BRI', _bankType == 'BRI'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildBankOption('Bank Lain', _bankType == 'Other'),
        ),
      ],
    );
  }

  Widget _buildBankOption(String label, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          _bankType = label == 'BRI' ? 'BRI' : 'Other';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00529C) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF00529C) : Colors.grey[300]!,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
    Widget? prefix,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefix: prefix,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}
