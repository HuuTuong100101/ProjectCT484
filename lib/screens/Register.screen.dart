// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

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

class _RegisterState extends State<Register> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("YES");
    } else {
      print("NO");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  // color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: 420,
                  width: double.infinity,
                  // color: Colors.lightBlue,
                  margin: EdgeInsets.symmetric(horizontal: 15),
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
                          // return '';
                        },
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.people),
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
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.email),
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
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                ? Icons.visibility : Icons.visibility_off
                              ),
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
                        decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.phone),
                            )),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlue),
                          ),
                          onPressed: () {
                            validation();
                          },
                          child: Text('Register'),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text("I have already an account !    "),
                          GestureDetector(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
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
