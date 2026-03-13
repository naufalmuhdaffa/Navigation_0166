import 'package:flutter/material.dart';
import 'order_detail_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Food")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderDetailPage(
                  makanan: "Nasi Goreng",
                  minuman: "Es Teh",
                  jumlahMakanan: "2",
                  jumlahMinuman: "1",
                  totalHarga: 30000,
                ),
              ),
            );
          },
          child: const Text("Checkout"),
        ),
      ),
    );
  }
}