import 'package:flutter/material.dart';
import 'package:goldshop/widgets/CardProduct.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Home');
          },
        ),
      ),

      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 180 / 250,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CardProduct(),
              const CardProduct(),
              const CardProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
