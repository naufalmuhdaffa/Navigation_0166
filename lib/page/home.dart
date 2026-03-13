import 'package:flutter/material.dart';
import '../page/order_page.dart';
import '../layout/main_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Home",
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderPage(),
              ),
            );
          },
          child: const Text("Go To Order"),
        ),
      ),
    );
  }
}