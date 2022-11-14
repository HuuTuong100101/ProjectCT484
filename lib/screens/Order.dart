// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:goldshop/widgets/CartWidget.dart';
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
          child: const Text(
            "Mua hàng",
            style: TextStyle(fontSize: 25),
          ),
          onPressed: (() {}),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          children: [Text("Tiền sản phẩm"), Text("${total}")],
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
                          children: [
                            Text("Tiền tiền"),
                            Text("\$ ${(total * 5 / 100) + 10.0}")
                          ],
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
