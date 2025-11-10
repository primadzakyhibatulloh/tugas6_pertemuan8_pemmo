import 'package:flutter/material.dart';
import 'package:h1d023040_tugas_6_pertemuan8/ui/tampil_data.dart'; 

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  void _kirimData() {
    // Validasi form
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        // Animasi transisi halaman yang lebih halus
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => TampilData(
            nama: _namaController.text,
            nim: _nimController.text,
            tahunLahir: _tahunLahirController.text,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Diri'),
      ),
      // Background dengan gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Card seukuran konten
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header di dalam Card
                      Text(
                        'Silakan Isi Data',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.indigo[800],
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24.0),
                      
                      // Field Nama
                      TextFormField(
                        controller: _namaController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Field NIM
                      TextFormField(
                        controller: _nimController,
                        decoration: const InputDecoration(
                          labelText: 'NIM',
                          prefixIcon: Icon(Icons.badge_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'NIM tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Field Tahun Lahir
                      TextFormField(
                        controller: _tahunLahirController,
                        decoration: const InputDecoration(
                          labelText: 'Tahun Lahir',
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tahun lahir tidak boleh kosong';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Masukkan tahun yang valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),

                      // Tombol Simpan
                      ElevatedButton(
                        onPressed: _kirimData,
                        child: const Text('Simpan'),
                      ),
                    ],
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