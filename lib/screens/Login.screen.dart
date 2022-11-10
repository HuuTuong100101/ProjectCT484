import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/widgets/Button.dart';
import 'package:goldshop/widgets/Account.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String role =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// ignore: unnecessary_new
RegExp regExp = new RegExp(role);
bool obserText = true;
String email = '';
String password = '';

class _LoginState extends State<Login> {
  void validation() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      try {
        final FirebaseAuth userCredential = FirebaseAuth.instance;
        await userCredential.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Đăng nhập thành công")));
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
      body: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return "Không được bỏ trống";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Email không hợp lệ";
                          }
                          return null;
                        },
                        onChanged: ((value) {
                          setState(() {
                            email = value;
                          });
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                          return null;
                        },
                        onChanged: ((value) {
                          setState(() {
                            password = value;
                          });
                        }),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.black),
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
                      Button(name: 'Login', onPressed: validation),
                      Account(
                          text: 'I have not account !  ',
                          btntext: 'Sign up',
                          ctx: context,
                          route: '/Register',
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
