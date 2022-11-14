import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/widgets/CardProduct.dart';

class AllProduct extends StatefulWidget {
  AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  final Stream<QuerySnapshot> Products =
      FirebaseFirestore.instance.collection('Products').snapshots();

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
            stream: Products,
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if (snapshot.hasError) {
                  return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return GridView.count(
                crossAxisSpacing: 10,
                childAspectRatio: 180 / 247,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return CardProduct(
                          name: '${data['Name']}',
                          image: '${data['Image']}',
                          price: '${data['Price']}',
                          description: '${data['Description']}',
                          brand: '${data['Brand']}',
                          state: '${data['State']}'
                      );
                }).toList(),
              );
            }
        ),
      ),
    );
  }
}
