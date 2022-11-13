import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': name,
      'description': description,
      'price': price,
      'imageUrl': image,
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }
}
