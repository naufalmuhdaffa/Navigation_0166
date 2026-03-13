import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
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

  final TextEditingController jumlahMakananController =
      TextEditingController();
  final TextEditingController jumlahMinumanController =
      TextEditingController();

  int totalHarga = 0;

  void calculateTotal() {
    final jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    final jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 20000) + (jumlahMinuman * 5000);
    });
  }

  @override
  void dispose() {
    makananController.dispose();
    minumanController.dispose();
    jumlahMakananController.dispose();
    jumlahMinumanController.dispose();
    super.dispose();
  }

  Widget _buildInputCard({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: MainLayout.labelColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: MainLayout.inputBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: MainLayout.primaryColor,
          ),
        ),
        filled: true,
        fillColor: MainLayout.inputFillColor,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required field";
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Order Food",
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 80,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Order Successfully!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MainLayout.textTitleColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Now you can order delicious foods!",
                style: TextStyle(
                  fontSize: 16,
                  color: MainLayout.textSubtitleColor,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Food Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: MainLayout.textTitleColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInputCard(
                      label: "Food Name",
                      controller: makananController,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    _buildInputCard(
                      label: "Drink Name",
                      controller: minumanController,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: MainLayout.textTitleColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInputCard(
                      label: "Food Quantity",
                      controller: jumlahMakananController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _buildInputCard(
                      label: "Drink Quantity",
                      controller: jumlahMinumanController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  calculateTotal();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailOrderPage(
                        makanan: makananController.text,
                        minuman: minumanController.text,
                        jumlahMakanan: jumlahMakananController.text,
                        jumlahMinuman: jumlahMinumanController.text,
                        totalHarga: totalHarga,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: MainLayout.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_rounded),
                    SizedBox(width: 8),
                    Text(
                      "Order Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}