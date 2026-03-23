import 'package:flutter/material.dart';

class FeatureScreen extends StatelessWidget {
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
        child: Text(
          '$title Screen',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Named exports for easier access
class BRIVAScreen extends FeatureScreen {
  const BRIVAScreen({super.key}) : super(title: 'BRIVA');
}

class TagihanScreen extends FeatureScreen {
  const TagihanScreen({super.key}) : super(title: 'Tagihan');
}

class QRISScreen extends FeatureScreen {
  const QRISScreen({super.key}) : super(title: 'QRIS');
}

class TopUpScreen extends FeatureScreen {
  const TopUpScreen({super.key}) : super(title: 'Top Up');
}

class LainnyaScreen extends FeatureScreen {
  const LainnyaScreen({super.key}) : super(title: 'Lainnya');
}
