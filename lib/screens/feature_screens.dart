import 'package:flutter/material.dart';

// Layar ini hanya sebagai base class untuk fitur yang belum diimplementasikan secara detail
abstract class FeatureScreen extends StatelessWidget {
  final String title;
  const FeatureScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF00529C),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Layar $title sedang dalam pengembangan.'),
      ),
    );
  }
}

// Layar bantuan atau placeholder sementara jika diperlukan
class HelpScreen extends FeatureScreen {
  const HelpScreen({super.key}) : super(title: 'Bantuan');
}
