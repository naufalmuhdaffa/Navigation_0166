import 'package:flutter/material.dart';
import 'package:navigation/auth/login.dart';
import 'package:navigation/page/home.dart';
import 'package:navigation/page/order_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/order': (context) => const OrderPage(),
      },
    );
  }
}