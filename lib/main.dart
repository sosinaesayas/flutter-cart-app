import 'package:flutter/material.dart';
import 'package:cart_app/features/home/ui/home.dart';
void main() {
  runApp(const Cart_app());
}

class Cart_app extends StatelessWidget {
  const Cart_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      home:Home()
    );
  }
}