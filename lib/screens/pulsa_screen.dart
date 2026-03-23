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
                  'Koneksi Tanpa Batas di Hari Fitri',
                  style: TextStyle(color: Colors.white70, fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPhoneInput(),
                  const SizedBox(height: 24),
                  const Text(
                    'Pilih Nominal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00529C)),
                  ),
                  const SizedBox(height: 16),
                  _buildNominalGrid(),
                  const SizedBox(height: 40),
                  _buildBuyButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text('Nomor Handphone', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54)),
        ),
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: 'Contoh: 0812XXXXXXXX',
            prefixIcon: const Icon(Icons.phone_android_outlined, color: Color(0xFF00529C)),
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
        ),
      ],
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
        childAspectRatio: 1.8,
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? const Color(0xFF00529C) : Colors.grey[200]!,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _nominals[index]['label'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? const Color(0xFF00529C) : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Harga: Rp ${_nominals[index]['price']}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
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
      height: 55,
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
          backgroundColor: Colors.orange[800],
          disabledBackgroundColor: Colors.grey[300],
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: const Text('Beli Sekarang', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
