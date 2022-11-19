class Product {
  final String name;
  final String brand;
  final String description;
  final String price;
  final String image;
  // ignore: non_constant_identifier_names
  final String State;
  Product(
      {required this.image,
      required this.name,
      required this.brand,
      // ignore: non_constant_identifier_names
      required this.State,
      required this.price,
      required this.description});
}
