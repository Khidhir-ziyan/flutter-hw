// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // "title" adalah data yang dikirim dari halaman sebelumnya
  // seperti "props" di React
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // tombol back otomatis muncul karena pakai Navigator
      ),
      body: Center(
        child: Text('Ini halaman detail: $title'),
      ),
    );
  }
}
