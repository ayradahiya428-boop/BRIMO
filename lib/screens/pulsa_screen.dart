import 'package:flutter/material.dart';
import 'confirm_pulsa_screen.dart';

class PulsaScreen extends StatefulWidget {
  const PulsaScreen({super.key});

  @override
  State<PulsaScreen> createState() => _PulsaScreenState();
}

class _PulsaScreenState extends State<PulsaScreen> {
  final _phoneController = TextEditingController();
  int? _selectedNominalIndex;

  final List<Map<String, dynamic>> _nominals = [
    {'label': '5.000', 'price': '6.500'},
    {'label': '10.000', 'price': '11.500'},
    {'label': '25.000', 'price': '26.000'},
    {'label': '50.000', 'price': '51.000'},
    {'label': '100.000', 'price': '100.000'},
    {'label': '200.000', 'price': '199.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Top Up Pulsa'),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhoneInput(),
            const SizedBox(height: 24),
            const Text(
              'Pilih Nominal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildNominalGrid(),
            const SizedBox(height: 40),
            _buildBuyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nomor Handphone', style: TextStyle(color: Colors.grey, fontSize: 13)),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: 'Contoh: 0812XXXXXXXX',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNominalGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2,
      ),
      itemCount: _nominals.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedNominalIndex == index;
        return InkWell(
          onTap: () {
            setState(() {
              _selectedNominalIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? const Color(0xFF00529C) : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _nominals[index]['label'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? const Color(0xFF00529C) : Colors.black87,
                  ),
                ),
                Text(
                  'Harga: Rp ${_nominals[index]['price']}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBuyButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _selectedNominalIndex == null ? null : () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmPulsaScreen(
                phoneNumber: _phoneController.text,
                nominal: _nominals[_selectedNominalIndex!]['label'],
                price: _nominals[_selectedNominalIndex!]['price'],
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00529C),
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text('Beli', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
