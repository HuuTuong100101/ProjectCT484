// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goldshop/widgets/OrderCard.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    double total = provider.totalPal;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng'),
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
            if (total > 10) {
              FirebaseFirestore.instance.collection("Orders").add({
                "Uid": FirebaseAuth.instance.currentUser?.uid,
                "Total": (total * 5.0 / 100.0) + 10.0,
                "Time": DateTime.now(),
              });
              provider.removeAllItem();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mua thàng công thành công")));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Giỏ hàng trống")));
            }
          }),
          child: const Text(
            "Mua hàng",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: provider.items.length + 1,
            itemBuilder: (context, index) => (index != provider.items.length)
                ? OrderCard(
                    name: provider.items.values.toList()[index].name,
                    brand: provider.items.values.toList()[index].brand,
                    image: provider.items.values.toList()[index].image,
                    price: provider.items.values.toList()[index].price,
                    quantity: provider.items.values.toList()[index].quantity,
                  )
                : Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tiền sản phẩm"),
                            Text("${total}")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Giảm giá"), Text("\$ 5%")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Tiền giao hàng"), Text("\$ 10")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Tiền tiền"), Text("\$ ${(total - total*5/100) + 10}")],
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
