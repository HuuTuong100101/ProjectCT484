import 'package:flutter/material.dart';
import 'package:goldshop/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  void addToCart({
    required String name,
    required String price,
    required String brand,
    required String image,
  }) {
    if (_items.containsKey(name)) {
      _items.update(
          name,
          (value) => CartModel(
              name: value.name,
              image: value.image,
              brand: value.brand,
              price: value.price,
              quantity: (value.quantity + 1)));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          name,
          () => CartModel(
              name: name,
              brand: brand,
              image: image,
              price: price,
              quantity: 1));

      notifyListeners();
    }
  }

  int count(String name, int quantity) {
    _items.update(
        name,
        (value) => CartModel(
            name: value.name,
            image: value.image,
            brand: value.brand,
            price: value.price,
            quantity: quantity));
    return quantity;
    // ignore: dead_code
    notifyListeners();
  }

  void removeItem(String name) {
    _items.remove(name);
    notifyListeners();
  }
}
