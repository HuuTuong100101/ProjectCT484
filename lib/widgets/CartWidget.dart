import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goldshop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  final String name;
  final String brand;
  final String image;
  final String price;
  int quantity;
  CartWidget({
    super.key,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            height: 120,
            width: 140,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.fill)),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(widget.name),
                Text(widget.brand),
                Text(
                  "\$${widget.price}",
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
                            if (widget.quantity > 1) {
                              widget.quantity--;
                            }
                          });
                        }),
                      ),
                      Text('${ Provider.of<CartProvider>(context, listen: false)
                                  .count(widget.name,widget.quantity)}'),
                      GestureDetector(
                        child: Icon(Icons.add),
                        onTap: (() {
                          setState(() {
                            widget.quantity++;
                          });
                        }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 50),
              child: Icon(Icons.delete),
            ),
            onTap: (() {
              Provider.of<CartProvider>(context, listen: false)
                  .removeItem(widget.name);
            }),
          )
        ],
      ),
    );
  }
}
