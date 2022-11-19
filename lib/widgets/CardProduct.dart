import 'package:flutter/material.dart';
import 'package:goldshop/screens/Detail.dart';
import 'package:goldshop/widgets/Button.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CardProduct extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String brand;
  final String price;
  final String state;

  const CardProduct(
      {super.key,
      required this.name,
      required this.image,
      required this.brand,
      required this.description,
      required this.price,
      required this.state});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 10,
      child: SizedBox(
        width: 160,
        height: 260,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detail(
                    image: widget.image,
                    brand: widget.brand,
                    description: widget.description,
                    state: widget.state,
                    name: widget.name,
                    price: widget.price)));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  widget.name,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "\$${widget.price}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                height: 30,
                child: Button(
                    name: 'Add to cart',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Cart');
                      provider.addToCart(
                          name: widget.name,
                          price: widget.price,
                          brand: widget.brand,
                          image: widget.image);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
