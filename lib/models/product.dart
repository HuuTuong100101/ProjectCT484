import 'package:flutter/material.dart';

class Product {
  final String name;
  final String brand;
  final String description;
  final String price;
  final String image;
  final String State;
  Product(
      {required this.image,
      required this.name,
      required this.brand,
      required this.State,
      required this.price,
      required this.description});
}
