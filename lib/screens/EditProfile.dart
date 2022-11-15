// ignore_for_file: unnecessary_new
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/widgets/Button.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

import '../widgets/Account.dart';

class EditProfile extends StatefulWidget {
  String UserName;
  String Phone;
  EditProfile(
      {super.key,
      required this.Phone,
      required this.UserName});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String role =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(role);
bool obserText = true;
String username = '';
String phone = '';

class _EditProfileState extends State<EditProfile> {
  void validation() async {
    if (_formKey.currentState!.validate()) {
      try {
        final update = FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({"UserName": username, "Phone": phone});
      } on FirebaseAuthException catch (e) {
        // ignore: unused_local_variable
        var content = e.message;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(content!)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin',),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  // color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Chỉnh sửa thông tin",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: 200,
                  width: double.infinity,
                  // color: Colors.lightBlue,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (String? value) {
                          if (value == '') {
                            setState(() {
                              username = widget.UserName;
                            });
                          }
                          if(value == '') {
                            
                          }
                        },
                        onChanged: ((value) {
                          setState(() {
                            username = value;
                          });
                        }),
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: const Icon(Icons.people),
                            )),
                      ),
                      TextFormField(
                        validator: (String? value) {
                          if (value == '') {
                            setState(() {
                              username = widget.Phone;
                            });
                          }
                        },
                        onChanged: ((value) {
                          setState(() {
                            phone = value;
                          });
                        }),
                        decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: const Icon(Icons.phone),
                            )),
                      ),
                      Button(name: 'Lưu', onPressed: validation),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
