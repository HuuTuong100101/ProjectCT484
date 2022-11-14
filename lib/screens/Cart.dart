// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:goldshop/screens/Order.dart';
import 'package:goldshop/widgets/CartWidget.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: ElevatedButton(
          onPressed: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => Order())));
          }),
          child: const Text(
            "Continous",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        child: ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) => CartWidget(
                  name: provider.items.values.toList()[index].name,
                  brand: provider.items.values.toList()[index].brand,
                  image: provider.items.values.toList()[index].image,
                  price: provider.items.values.toList()[index].price,
                  quantity: provider.items.values.toList()[index].quantity,
                )),
      ),
    );
  }
}
