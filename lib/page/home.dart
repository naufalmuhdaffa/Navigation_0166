import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Home",
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      MainLayout.primaryColor,
                      MainLayout.accentOrange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Let's order your favorite foods today!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.fastfood_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MainLayout.textTitleColor,
                ),
              ),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: Colors.black.withOpacity(0.06),
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: MainLayout.inputFillColor,
                        child: Icon(
                          Icons.restaurant_menu,
                          color: MainLayout.primaryColor,
                        ),
                      ),
                      title: const Text("Order Food"),
                      subtitle: const Text("Browse menu and order"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.pushNamed(context, "/order");
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: MainLayout.inputFillColor,
                        child: Icon(
                          Icons.receipt_long,
                          color: MainLayout.primaryColor,
                        ),
                      ),
                      title: const Text("View Orders"),
                      subtitle: const Text("Check your order history"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Featured Food",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MainLayout.textTitleColor,
                ),
              ),
              const SizedBox(height: 16),

              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/food.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: MainLayout.accentYellow.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.local_offer,
                      color: MainLayout.accentOrange,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Special offer today! Get 20% off for your first order.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: MainLayout.textTitleColor,
                        ),
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