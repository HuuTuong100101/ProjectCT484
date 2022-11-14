import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> Nike = [];
  List<Product> Adidas = [];
  List<Product> Jumpman = [];
  List<Product> Vans = [];
  List<Product> Converse = [];
  List<Product> Fila = [];

  Future<void> getNikeData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc("TfthcYymbGEex9QXfPVf")
        .collection('NikeProducts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var data in querySnapshot.docs) {
        // print(data.data());
        newlist.add(Product(
            image: data["Image"],
            name: data["Name"],
            brand: data["Brand"],
            price: data["Price"],
            State: data["State"],
            description: data["Description"]));
        notifyListeners();
      }
    });
    Nike = newlist;
  }

  // ignore: non_constant_identifier_names
  List<Product> get getNikeDataList {
    getNikeData();
    return Nike;
  }
}
