import 'dart:ffi';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String ImageUrl;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.ImageUrl});
}
