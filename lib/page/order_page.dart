import 'package:flutter/material.dart';
import 'order_detail_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();

  int makananQty = 0;
  int minumanQty = 0;

  int totalHarga = 0;

  void hitungTotal() {
    totalHarga = (makananQty * 20000) + (minumanQty * 5000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Food")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: makananController,
              decoration: const InputDecoration(labelText: "Food"),
            ),
            TextField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: "Drink"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                hitungTotal();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailPage(
                      makanan: makananController.text,
                      minuman: minumanController.text,
                      jumlahMakanan: makananQty.toString(),
                      jumlahMinuman: minumanQty.toString(),
                      totalHarga: totalHarga,
                    ),
                  ),
                );
              },
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}