import 'package:flutter/material.dart';
import 'package:goldshop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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
      elevation: 4, // Change this
      shadowColor: Colors.black12,
      child: Row(
        children: <Widget>[
          Container(
            height: 120,
            width: 140,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.fill)),
          ),
          Container(
            height: 120,
            width: 140,
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(widget.name),
                Text(
                  "\$${widget.price}",
                  style: const TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            if (widget.quantity > 1) {
                              widget.quantity--;
                            }
                          });
                        }),
                        child: const Icon(Icons.remove),
                      ),
                      Text(
                          '${Provider.of<CartProvider>(context, listen: false).count(widget.name, widget.quantity)}'),
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            widget.quantity++;
                          });
                        }),
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (() {
              try {
                Provider.of<CartProvider>(context, listen: false)
                    .removeItem(widget.name);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Xóa thành công"),
                  backgroundColor: Colors.green,
                ));
                Navigator.popAndPushNamed(context, '/Cart');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Xóa lỗi"),
                  backgroundColor: Colors.red,
                ));
              }
            }),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
