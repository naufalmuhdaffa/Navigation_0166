import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final String makanan;
  final String minuman;
  final String jumlahMakanan;
  final String jumlahMinuman;
  final int totalHarga;

  const OrderDetailPage({
    super.key,
    required this.makanan,
    required this.minuman,
    required this.jumlahMakanan,
    required this.jumlahMinuman,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Detail")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Makanan: $makanan"),
            Text("Jumlah: $jumlahMakanan"),
            const SizedBox(height: 10),
            Text("Minuman: $minuman"),
          ],
        ),
      ),
    );
  }
}