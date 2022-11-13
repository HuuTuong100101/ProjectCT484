// import 'dart:html';

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Nike_2.jpg"),
                        fit: BoxFit.fill)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text("Name"),
                    const Text("Brand"),
                    const Text(
                      "\$400",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(Icons.remove),
                            onTap: (() {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            }),
                          ),
                          Text('${count}'),
                          GestureDetector(
                            child: Icon(Icons.add),
                            onTap: (() {
                              setState(() {
                                  count++;
                              });
                            }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
