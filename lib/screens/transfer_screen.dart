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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Ramadan Slim Header
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF00529C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Center(
                child: Text(
                  'Bagi Berkah di Bulan Suci',
                  style: TextStyle(color: Colors.white70, fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tujuan Transfer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00529C)),
                  ),
                  const SizedBox(height: 16),
                  _buildBankSelection(),
                  const SizedBox(height: 24),
                  _buildInputField(
                    label: 'Nomor Rekening',
                    controller: _accountController,
                    hint: 'Contoh: 1234567890',
                    keyboardType: TextInputType.number,
                    icon: Icons.account_box_outlined,
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: 'Nominal Transfer',
                    controller: _amountController,
                    hint: 'Rp 0',
                    keyboardType: TextInputType.number,
                    icon: Icons.payments_outlined,
                    prefix: const Text('Rp ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00529C))),
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: 'Catatan (Opsional)',
                    controller: _notesController,
                    hint: 'Contoh: Sedekah Ramadhan',
                    maxLines: 2,
                    icon: Icons.note_add_outlined,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
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
                        backgroundColor: Colors.orange[800],
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
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
          ],
        ),
      ),
    );
  }

  Widget _buildBankSelection() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildBankOption('BRI', _bankType == 'BRI'),
          ),
          Expanded(
            child: _buildBankOption('Bank Lain', _bankType == 'Other'),
          ),
        ],
      ),
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
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF00529C) : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon, color: const Color(0xFF00529C), size: 20) : null,
            prefix: prefix,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF00529C), width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}
