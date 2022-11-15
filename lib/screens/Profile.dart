import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goldshop/models/product.dart';
import 'package:goldshop/models/user.dart';
import 'package:goldshop/provider/user_Provider.dart';
import 'package:goldshop/screens/EditProfile.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

Future<DocumentSnapshot> getData() async {
  final user = await FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .get();
  return user;
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin khách hàng'),
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
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(
                        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.6435-9/81813335_2173362772960111_8653992229628542976_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=NeLppJAPJJAAX8SRiva&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfAdsYEIGSKF4xmYMcr331KCjUSUBIVTSelegG2DILgMMg&oe=639AA9D8"),
                  )
                ],
              ),
            ),
            FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Name"),
                              Text(snapshot.data["UserName"])
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email"),
                              Text(snapshot.data["UserEmail"])
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Phone"),
                              Text(snapshot.data["Phone"])
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => EditProfile(
                                    UserName: snapshot.data["UserName"],
                                    Phone: snapshot.data["Phone"],
                                  ))));
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 17),
                            ),
                          ))
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
