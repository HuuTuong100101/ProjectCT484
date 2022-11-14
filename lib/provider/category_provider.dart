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

  Future<void> getJumpmanData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc("4GK0zhbD0glSTnzIIyuP")
        .collection('JordanProducts')
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
    Jumpman = newlist;
  }

  Future<void> getAdidasData() async {
    List<Product> newlist = [];
    var demo = await FirebaseFirestore.instance
        .collection('Categories')
        .doc("T1kWF6FWL8F8CF98Xs6U")
        .collection('AdidasProducts')
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
    Adidas = newlist;
  }

  Future<void> getConverseData() async {
    List<Product> newlist = [];
    var demo = await FirebaseFirestore.instance
        .collection('Categories')
        .doc("k5l8blMgfGrrlPwK1NG3")
        .collection('ConverseProducts')
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
    Converse = newlist;
  }

  Future<void> getVansData() async {
    List<Product> newlist = [];
    var demo = await FirebaseFirestore.instance
        .collection('Categories')
        .doc("oJlGsoi1fpTcxCmUnUMd")
        .collection('VansProducts')
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
    Vans = newlist;
  }

  Future<void> getFilaData() async {
    List<Product> newlist = [];
    var demo = await FirebaseFirestore.instance
        .collection('Categories')
        .doc("uv8rTq7pAHJszRq4utAV")
        .collection('FilaProducts')
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
    Fila = newlist;
  }

  // ignore: non_constant_identifier_names
  List<Product> get getNikeDataList {
    getNikeData();
    return Nike;
  }

  List<Product> get getAdidasDataList {
    getAdidasData();
    return Adidas;
  }

  List<Product> get getFilaDataList {
    getFilaData();
    return Fila;
  }

  List<Product> get getJumpmanDataList {
    getJumpmanData();
    return Jumpman;
  }

  List<Product> get getVansDataList {
    getVansData();
    return Vans;
  }

  List<Product> get getConverseDataList {
    getConverseData();
    return Converse;
  }
}
