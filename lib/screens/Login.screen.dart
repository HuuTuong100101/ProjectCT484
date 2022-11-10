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

RegExp regExp = new RegExp(role);
bool obserText = true;

class _LoginState extends State<Login> {
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
                      Text(
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
                          // return '';
                        },
                        decoration: InputDecoration(
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
                          // return '';
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black),
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
