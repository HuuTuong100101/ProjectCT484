import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class UserProvider with ChangeNotifier {
  List<Product> Nike = [];

  Future<void> getNikeData() async {
    List<Product> newlist = [];
    var demo = await FirebaseFirestore.instance
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
