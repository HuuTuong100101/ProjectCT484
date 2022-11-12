import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          // decoration: BoxDecoration(color: Colors.red.withOpacity(0.5)),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Nike_2.jpg'),
          ),
          accountName: Text(
            "Hữu Tường",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            "tuongb1910480@gmail.com",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: (() {
            Navigator.pushReplacementNamed(context, '/Home');
          }),
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),
        ListTile(
          onTap: (() {
            Navigator.pushReplacementNamed(context, '/Cart');
          }),
          leading: Icon(Icons.shopping_cart),
          title: Text("Cart"),
        ),
        ListTile(
          onTap: (() {
            // Navigator.pushReplacementNamed(context, '/Home');
          }),
          leading: Icon(Icons.logout),
          title: Text("Logout"),
        ),
      ],
    );
  }
}