import 'package:flutter/material.dart';
import 'package:h1d023040_tugas_6_pertemuan8/ui/form_data.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6 Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo[700],
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4.0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.indigo[50]!.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: Colors.indigo[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[600],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // INI BAGIAN YANG DIPERBAIKI
        cardTheme: CardThemeData(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.antiAlias,
        ),
      ),
      home: const FormData(),
      debugShowCheckedModeBanner: false,
    );
  }
}