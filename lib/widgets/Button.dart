// ignore: file_names
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final Function onPressed;

  const Button({super.key, required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(name),
      ),
    );
  }
}
