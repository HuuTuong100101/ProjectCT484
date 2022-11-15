import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/provider/cart_provider.dart';
import 'package:goldshop/provider/category_provider.dart';
import 'package:goldshop/provider/user_Provider.dart';
import 'package:goldshop/screens/AllProduct.dart';
import 'package:goldshop/screens/Cart.dart';
import 'package:goldshop/screens/Home.dart';
import 'package:goldshop/screens/Login.screen.dart';
import 'package:goldshop/screens/Profile.dart';
import 'package:goldshop/screens/Register.screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        Provider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        Provider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: {
          '/Register': (context) => const Register(),
          '/Login': (context) => const Login(),
          '/Home': (context) => Home(),
          '/Profile': (context) =>  Profile(),
          '/Cart': (context) => const Cart()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
        ),
        home:
        StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return const Login();
              }
            })
        ),
      ),
    );
  }
}
