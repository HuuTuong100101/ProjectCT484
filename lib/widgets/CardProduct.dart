import 'package:flutter/material.dart';
import 'package:goldshop/screens/Detail.dart';
import 'package:goldshop/widgets/Button.dart';

class CardProduct extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  
  const CardProduct({super.key, required this.name, required this.image, required this.price});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  void add() {
    Navigator.pushNamed(context, '/Cart');
  }

  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return Card(
      child: SizedBox(
        width: 160,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detail(
                    image: widget.image,
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
              Text(
                "\$${widget.price}",
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.name,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                height: 30,
                child: Button(name: 'Add to cart', onPressed: add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
