// ignore: file_names
import 'package:flutter/material.dart';
import 'package:goldshop/screens/Home.dart';
import 'package:goldshop/widgets/CardProduct.dart';

import '../models/product.dart';

class AllProduct extends StatelessWidget {
  final List<Product> snapshot;
  const AllProduct({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        child: GridView.count(
            crossAxisSpacing: 10,
            childAspectRatio: 180 / 247,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: snapshot
                .map((e) => CardProduct(
                    name: e.name,
                    image: e.image,
                    brand: e.brand,
                    description: e.description,
                    price: e.price,
                    state: e.State))
                .toList()),
      ),
    );
  }
}
