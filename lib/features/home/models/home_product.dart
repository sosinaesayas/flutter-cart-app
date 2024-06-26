class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'], 
    name: json['name'], 
    description: json['description'], 
    price: json['price'], 
    imageUrl: json['imageUrl']);
}
