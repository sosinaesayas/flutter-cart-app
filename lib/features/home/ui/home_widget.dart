import 'package:flutter/material.dart';
import "package:cart_app/features/home/models/home_product.dart";

class Home_widget extends StatefulWidget {
  const Home_widget({super.key});

  @override
  State<Home_widget> createState() => _Home_widgetState();
}

class _Home_widgetState extends State<Home_widget> {
  @override
  Widget build(BuildContext context) {
    final ProductModel productModel;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust the number of columns in the grid
        crossAxisSpacing: 10.0, // Adjust spacing between columns
        mainAxisSpacing: 10.0, 
        ),// Adjust spacing between rows
        // itemCount: productModels.length,
        itemBuilder: (BuildContext context, int index) { 

         },
    );
  }
}