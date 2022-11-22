// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    // getOrderHistories();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Đơn hàng'),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                try {
                  FirebaseFirestore.instance
                      .collection('Orders')
                      .where("Uid",
                          isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                      .get()
                      .then((value) {
                    for (var i = 0; i < value.docs.length; i++) {
                      FirebaseFirestore.instance
                          .collection("Orders")
                          .doc(value.docs[i].id)
                          .delete();
                    }
                  });
                   ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Xóa thành công")));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Lỗi")));
                }
              },
              child: const Text("Delete All"),
            )
          ],
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Orders')
                    .where("Uid",
                        isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: ((context, index) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: SizedBox(
                              width: double.infinity,
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              "Thời gian mua: ${snapshot.data?.docs[index]['Time']}",
                                              style: const TextStyle(fontSize: 19),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Tổng tiền: \$${snapshot.data?.docs[index]['Total']}",
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 350,
                                              child: Text(
                                                "Chi tiết hóa đơn: \n ${snapshot.data?.docs[index]['Detail']} \n",
                                                style: const TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              try {
                                                FirebaseFirestore.instance
                                                    .collection("Orders")
                                                    .doc(
                                                        '${snapshot.data?.docs[index].id}')
                                                    .delete();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Xóa đơn hàng thành công")));
                                              } catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                            content:
                                                                Text("Lỗi")));
                                              }
                                            },
                                            child: const Icon(Icons.delete))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )));
                }))));
  }
}
