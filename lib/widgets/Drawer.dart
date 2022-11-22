import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  final String username;
  final String email;
  const DrawerWidget({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.6435-9/81813335_2173362772960111_8653992229628542976_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=NeLppJAPJJAAX8SRiva&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfAdsYEIGSKF4xmYMcr331KCjUSUBIVTSelegG2DILgMMg&oe=639AA9D8"),
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
