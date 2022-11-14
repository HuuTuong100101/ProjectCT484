import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goldshop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  final String name;
  final String brand;
  final String image;
  final String price;
  int quantity;
  OrderCard({
    super.key,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,  // Change this 
      shadowColor: Colors.black12,
      child: Row(
        children: <Widget>[
          Container(
            height: 120,
            width: 140,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.fill)),
          ),
          Expanded(
            child: Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Tên: ${widget.name}'),
                  Text('Thương hiệu: ${widget.brand}'),
                  Text(
                    "Giá: \$${widget.price}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("Số lượng: ${widget.quantity}"),
                  Text("Tổng: \$ ${widget.quantity * double.parse(widget.price)}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
