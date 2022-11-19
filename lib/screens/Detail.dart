// ignore: file_names
import 'package:flutter/material.dart';
import 'package:goldshop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String brand;
  final String price;
  final String state;
  // ignore: use_key_in_widget_constructors
  const Detail({required this.image, required this.name, required this.price, required this.description, required this.brand, required this.state});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 350,
                  child: Card(
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.name}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Wrap(
                          children: <Widget>[
                            Text(
                              "${widget.description}",
                              style: TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.italic),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                         Navigator.pushNamed(context, '/Cart');
                          provider.addToCart(
                          name: widget.name,
                          price: widget.price,
                          brand: widget.brand,
                          image: widget.image);
                      },
                      child: const Text('Add to cart'),
                    ),
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
