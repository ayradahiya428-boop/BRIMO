import 'package:flutter/material.dart';
import 'transfer_screen.dart';
import 'ewallet_screen.dart';
import 'pulsa_screen.dart';
import 'briva_screen.dart';
import 'tagihan_screen.dart';
import 'qr_screen.dart';
import 'topup_screen.dart';
import 'more_menu_screen.dart';
import 'account_detail_screen.dart';
import 'promo_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRamadanHeader(),
            const SizedBox(height: 10),
            _buildFeatureGrid(),
            _buildPromoBanner(),
            _buildQuickAccess(),
          ],
        ),
      ),
    );
  }

  Widget _buildRamadanHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF00529C), Color(0xFF003D75)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          // Ornaments
          Positioned(
            top: -20,
            right: -20,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.grid_4x4, size: 200, color: Colors.white),
            ),
          ),
          // Lanterns
          Positioned(
            top: 40,
            left: 20,
            child: Icon(Icons.light, color: Colors.orangeAccent.withOpacity(0.5), size: 24),
          ),
          Positioned(
            top: 20,
            right: 50,
            child: Icon(Icons.light, color: Colors.orangeAccent.withOpacity(0.5), size: 32),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat Berpuasa,',
                              style: TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                            const Text(
                              'Irfan Mansyur',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_none_outlined, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.help_outline, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Premium Account Card
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountDetailScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF004685),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: -2,
                        ),
                      ],
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Tabungan Utama',
                              style: TextStyle(color: Colors.white60, fontSize: 13),
                            ),
                            Icon(Icons.credit_card, color: Colors.white24, size: 20),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1234-01-000567-50-2',
                          style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Saldo',
                                  style: TextStyle(color: Colors.white60, fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      _isBalanceVisible ? 'Rp 972.000.000.00' : 'Rp ••••••••',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isBalanceVisible = !_isBalanceVisible;
                                        });
                                      },
                                      child: Icon(
                                        _isBalanceVisible
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: Colors.white60,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Detail',
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid() {
    final List<Map<String, dynamic>> features = [
      {'icon': Icons.swap_horiz, 'label': 'Transfer', 'screen': const TransferScreen(), 'color': Colors.blue[600]},
      {'icon': Icons.receipt_long, 'label': 'BRIVA', 'screen': const BRIVAScreen(), 'color': Colors.blue[400]},
      {'icon': Icons.account_balance_wallet, 'label': 'E-Wallet', 'screen': const EWalletScreen(), 'color': Colors.orange},
      {'icon': Icons.phone_android, 'label': 'Pulsa/Data', 'screen': const PulsaScreen(), 'color': Colors.redAccent},
      {'icon': Icons.description, 'label': 'Tagihan', 'screen': const TagihanScreen(), 'color': Colors.teal},
      {'icon': Icons.qr_code, 'label': 'QRIS', 'screen': const QRScreen(), 'color': Colors.indigo},
      {'icon': Icons.add_circle_outline, 'label': 'Top Up', 'screen': const TopUpScreen(), 'color': Colors.green},
      {'icon': Icons.grid_view, 'label': 'Lainnya', 'screen': const MoreMenuScreen(), 'color': Colors.grey[700]},
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => feature['screen']),
              );
            },
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    feature['icon'],
                    color: feature['color'],
                    size: 26,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feature['label'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoBanner() {
    final List<Map<String, dynamic>> promos = [
      {'title': 'Ramadan Berkah', 'desc': 'Cashback 50% untuk Buka Puasa', 'color': Colors.orange[800]},
      {'title': 'Mudik Asik', 'desc': 'Diskon Tiket Kereta & Pesawat', 'color': const Color(0xFF00529C)},
      {'title': 'Zakat Digital', 'desc': 'Salurkan Zakat via BRIVA', 'color': Colors.teal[600]},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Promo Ramadhan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lihat Semua',
                style: TextStyle(color: Colors.orange[800], fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: promos.length,
            itemBuilder: (context, index) {
              final promo = promos[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PromoDetailScreen(promo: promo)),
                  );
                },
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        promo['color'],
                        promo['color'].withOpacity(0.8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: promo['color'].withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        bottom: -20,
                        child: Icon(Icons.stars, size: 100, color: Colors.white10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'PROMO',
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              promo['title'],
                              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              promo['desc'],
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccess() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Akses Cepat',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildQuickItem(Icons.history, 'Mutasi Terakhir', Colors.blue),
                const Divider(height: 1, indent: 60),
                _buildQuickItem(Icons.article_outlined, 'Daftar Riwayat', Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickItem(IconData icon, String title, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: () {},
    );
  }
}
