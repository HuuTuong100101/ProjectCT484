// ignore: file_names, unused_import
import 'dart:ffi';

import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String text;
  final String btntext;
  final BuildContext ctx;
  final String route;

  const Account(
      {super.key,
      required this.text,
      required this.btntext,
      required this.ctx,
      required this.route});
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Row(
      children: <Widget>[
        Text(text),
        GestureDetector(
          // ignore: prefer_const_constructors
          child: Text(
            btntext,
            style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(ctx, route);
          },
        )
      ],
    );
  }
}
