// ignore_for_file: unnecessary_new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldshop/widgets/Button.dart';
import '../widgets/Account.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String role =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(role);
bool obserText = true;
String email = '';
String username = '';
String phone = '';
String password = '';

class _RegisterState extends State<Register> {
  void validation() async {
    if (_formKey.currentState!.validate()) {
      try {
        final FirebaseAuth userCredential = FirebaseAuth.instance;
        UserCredential us = await userCredential.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());

        // ignore: use_build_context_synchronously
        final docUser = FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid);
        await docUser.set({
          "UserName": username,
          "UserId": us.user?.uid,
          "UserEmail": email,
          "Phone": phone,
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Đăng ký tài khoản thành công")));
      } on FirebaseAuthException catch (e) {
        // ignore: unused_local_variable
        var content = e.message;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(content!)));
      } on PlatformException catch (e) {
        var content = e.message;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(content!)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Đăng Ký",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 420,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      validator: (String? value) {
                        if (value == '') {
                          return "Không được bỏ trống";
                        }
                        if (value!.length < 6) {
                          return "Quá ngắn";
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
                      validator: (value) {
                        if (value == '') {
                          return "Không được bỏ trống";
                        } else if (!regExp.hasMatch(value!)) {
                          return "Email không hợp lệ";
                        }
                        // return '';
                      },
                      onChanged: ((value) {
                        setState(() {
                          email = value;
                        });
                      }),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            child: const Icon(Icons.email),
                          )),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (String? value) {
                        if (value == '') {
                          return "Không được bỏ trống";
                        }
                        if (value!.length < 8) {
                          return "Quá ngắn";
                        }
                        // return '';
                      },
                      onChanged: ((value) {
                        setState(() {
                          password = value;
                        });
                      }),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(obserText == true
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value == '') {
                          return "Không được bỏ trống";
                        }
                        if (value!.length < 10) {
                          return "Phải có 10 số OK !";
                        }
                        // return '';
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
                    Button(name: 'Sign up', onPressed: validation),
                    Account(
                      text: 'I have not account !  ',
                      btntext: 'Login',
                      ctx: context,
                      route: '/Login',
                    )
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
