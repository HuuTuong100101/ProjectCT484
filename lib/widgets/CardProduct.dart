import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:goldshop/widgets/Button.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
    void add() {
      Navigator.pushReplacementNamed(context, '/Cart');
    }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 160,
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  // ignore: prefer_const_constructors
                  image: DecorationImage(
                    image: const AssetImage('assets/images/carosoue1.jpg'),
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "\$50",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Nike super",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            // Row(
            Button(name: 'Add to cart',onPressed: add)
            // )
          ],
        ),
      ),
    );
  }
}
