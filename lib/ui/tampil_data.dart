import 'package:flutter/material.dart';

class TampilData extends StatefulWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  @override
  State<TampilData> createState() => _TampilDataState();
}

class _TampilDataState extends State<TampilData> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _hitungUmur() {
    try {
      int tahun = int.parse(widget.tahunLahir);
      int tahunSekarang = DateTime.now().year;
      return tahunSekarang - tahun;
    } catch (e) {
      return 0;
    }
  }

  // Widget helper untuk baris info
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo[700], size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int umur = _hitungUmur();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // SOLUSI UNTUK OVERFLOW: SingleChildScrollView
        child: SingleChildScrollView( 
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Avatar Profil
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.indigo[100],
                            child: Icon(
                              Icons.person_outline,
                              size: 60,
                              color: Colors.indigo[700],
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Nama (sebagai header)
                          Text(
                            widget.nama,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Perkenalkan, ini data diri saya:',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey[700],
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 10),

                          // Detail Info 
                          _buildInfoRow(Icons.badge_outlined, 'NIM', widget.nim),
                          // DIPISAHKAN: Hanya menampilkan umur
                          _buildInfoRow(Icons.cake_outlined, 'UMUR', '$umur tahun'), 
                          // DIPISAHKAN: Menampilkan tahun lahir saja
                          _buildInfoRow(Icons.calendar_today_outlined, 'TAHUN LAHIR', widget.tahunLahir), 
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}