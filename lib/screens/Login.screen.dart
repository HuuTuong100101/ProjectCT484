import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
final TextEditingController email = TextEditingController();
final TextEditingController pass = TextEditingController();

class _LoginState extends State<Login> {
  void submit(context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Đăng nhập thành công"),
        backgroundColor: Colors.green,
      ));
       Navigator.pushReplacementNamed(context, '/Home');
    } on PlatformException{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tài khoản hoặc mật khẩu không đúng !"),
          backgroundColor: Colors.red,
        ));
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tài khoản hoặc mật khẩu không đúng !"),
          backgroundColor: Colors.red,
        ));
    }
  }

  void vaildation() async {
    if (email.text.isEmpty && pass.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
            content: Text("Không được bỏ trống"),
            backgroundColor: Colors.red,
          ));
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
            content: Text("Bạn chưa nhập Email"),
            backgroundColor: Colors.red,
          ));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
            content: Text("Email không hợp lệ"),
            backgroundColor: Colors.red,
          ));
    } else if (pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Bạn chưa nhập mật khẩu"),
            backgroundColor: Colors.red,
          ));
    } else if (pass.text.length < 8) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
            content: Text("Mật khẩu không hợp lệ"),
            backgroundColor: Colors.red,
          ));
    } else {
      submit(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
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
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      controller: pass,
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
                    Button(name: 'Login', onPressed: vaildation),
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
    );
  }
}
