// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> Nike = [];
  List<Product> Adidas = [];
  List<Product> Jumpman = [];
  List<Product> Vans = [];
  List<Product> Converse = [];
  List<Product> Fila = [];

  Future<void> getNikeData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Products')
        .where("Brand", isEqualTo: "Nike")
        .get()
        .then((data) {
      for (var i = 0; i < data.docs.length; i++) {
        // print(data.data());
        newlist.add(Product(
            image: '${data.docs[i]['Image']}',
            name: '${data.docs[i]['Name']}',
            brand: '${data.docs[i]['Brand']}',
            price: '${data.docs[i]['Price']}',
            State: '${data.docs[i]['State']}',
            description: '${data.docs[i]['Description']}'));
        notifyListeners();
      }
    });
    Nike = newlist;
  }

  Future<void> getJumpmanData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Products')
        .where("Brand", isEqualTo: "Jumpman")
        .get()
        .then((data) {
      for (var i = 0; i < data.docs.length; i++) {
        // print(data.data());
        newlist.add(Product(
            image: '${data.docs[i]['Image']}',
            name: '${data.docs[i]['Name']}',
            brand: '${data.docs[i]['Brand']}',
            price: '${data.docs[i]['Price']}',
            State: '${data.docs[i]['State']}',
            description: '${data.docs[i]['Description']}'));
        notifyListeners();
      }
    });
    Jumpman = newlist;
  }

  Future<void> getAdidasData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Products')
        .where("Brand", isEqualTo: "Adidas")
        .get()
        .then((data) {
      for (var i = 0; i < data.docs.length; i++) {
        // print(data.data());
        newlist.add(Product(
            image: '${data.docs[i]['Image']}',
            name: '${data.docs[i]['Name']}',
            brand: '${data.docs[i]['Brand']}',
            price: '${data.docs[i]['Price']}',
            State: '${data.docs[i]['State']}',
            description: '${data.docs[i]['Description']}'));
        notifyListeners();
      }
    });
    Adidas = newlist;
  }

  Future<void> getConverseData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Products')
        .where("Brand", isEqualTo: "Converse")
        .get()
        .then((data) {
      for (var i = 0; i < data.docs.length; i++) {
        // print(data.data());
        newlist.add(Product(
            image: '${data.docs[i]['Image']}',
            name: '${data.docs[i]['Name']}',
            brand: '${data.docs[i]['Brand']}',
            price: '${data.docs[i]['Price']}',
            State: '${data.docs[i]['State']}',
            description: '${data.docs[i]['Description']}'));
        notifyListeners();
      }
    });
    Converse = newlist;
  }

  Future<void> getVansData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Products')
        .where("Brand", isEqualTo: "Vans")
        .get()
        .then((data) {
      for (var i = 0; i < data.docs.length; i++) {
        // print(data.data());
        newlist.add(Product(
            image: '${data.docs[i]['Image']}',
            name: '${data.docs[i]['Name']}',
            brand: '${data.docs[i]['Brand']}',
            price: '${data.docs[i]['Price']}',
            State: '${data.docs[i]['State']}',
            description: '${data.docs[i]['Description']}'));
        notifyListeners();
      }
    });
    Vans = newlist;
  }

  Future<void> getFilaData() async {
    List<Product> newlist = [];
    await FirebaseFirestore.instance
        .collection('Products')
        .where("Brand", isEqualTo: "Fila")
        .get()
        .then((data) {
      for (var i = 0; i < data.docs.length; i++) {
        // print(data.data());
        newlist.add(Product(
            image: '${data.docs[i]['Image']}',
            name: '${data.docs[i]['Name']}',
            brand: '${data.docs[i]['Brand']}',
            price: '${data.docs[i]['Price']}',
            State: '${data.docs[i]['State']}',
            description: '${data.docs[i]['Description']}'));
        notifyListeners();
      }
    });
    Fila = newlist;
  }

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
