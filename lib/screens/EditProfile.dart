// ignore_for_file: unnecessary_new, use_build_context_synchronously, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/widgets/Button.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  String UserName;
  String Phone;
  EditProfile(
      {super.key,
      required this.Phone,
      required this.UserName,});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String role =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(role);
bool obserText = true;

class _EditProfileState extends State<EditProfile> {
  void validation() {
    if (_formKey.currentState!.validate()) {
      try {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({"UserName": widget.UserName, "Phone": widget.Phone,});
        ScaffoldMessenger.of(context)
            // ignore: prefer_const_constructors
            .showSnackBar(SnackBar(
          content: const Text("Cập nhật thành công !"),
          backgroundColor: Colors.green,
        ));
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // ignore: unused_local_variable
        var content = e.message;
        ScaffoldMessenger.of(context)
            // ignore: prefer_const_constructors
            .showSnackBar(SnackBar(
          content: const Text("Thất bại!"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chỉnh sửa thông tin',
        ),
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
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              SizedBox(
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
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      onChanged: ((value) {
                        setState(() {
                          widget.UserName = value;
                        });
                      }),
                      decoration: InputDecoration(
                          hintText: widget.UserName,
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
                      onChanged: ((value) {
                        setState(() {
                          widget.Phone = value;
                        });
                      }),
                      decoration: InputDecoration(
                          hintText: widget.Phone,
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
    );
  }
}
