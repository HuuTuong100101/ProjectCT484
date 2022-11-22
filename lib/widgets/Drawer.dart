import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  final String username;
  final String email;
  // ignore: non_constant_identifier_names
  final String Phone;
  const DrawerWidget(
      {super.key,
      required this.username,
      required this.email,
      // ignore: non_constant_identifier_names
      required this.Phone});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture:const CircleAvatar(
            backgroundImage: AssetImage('assets/images/account.png'),
          ),
          accountName: Text(
            username,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            email,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
          ),
          onPressed: (() {
            Navigator.pushNamed(context, '/Home');
          }),
          child: const ListTile(
            leading: Icon(Icons.home),
            title: Text("Trang chủ"),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
          ),
          onPressed: (() {
            Navigator.pushNamed(context, '/Profile');
          }),
          child: const ListTile(
            leading: Icon(Icons.people),
            title: Text("Thông tin cá nhân"),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
          ),
          onPressed: (() {
            Navigator.pushNamed(context, '/Order');
          }),
          child: const ListTile(
            leading: Icon(Icons.list),
            title: Text("Lịch sử mua hàng"),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
          ),
          onPressed: (() {
            Navigator.pushNamed(context, '/Cart');
          }),
          child: const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Giỏ hàng"),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
          ),
          onPressed: (() {
            try {
              FirebaseAuth.instance.signOut();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Đăng xuất thành công"),
                backgroundColor: Colors.green,
              ));
              Navigator.pushReplacementNamed(context, '/Login');
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Đăng xuất lỗi"),
                backgroundColor: Colors.green,
              ));
            }
          }),
          child: const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Đăng xuất"),
          ),
        )
      ],
    );
  }
}
