import 'package:flutter/material.dart';
import 'package:goldshop/screens/Login.screen.dart';
import 'package:goldshop/screens/Register.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/Register': (context) => const Register(),
        '/Login': (context) => const Login(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:const Login(),
    );
  }
}
