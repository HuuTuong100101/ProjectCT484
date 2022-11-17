// ignore: file_names
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String name;
  final Function onPressed;

  const Button({super.key, required this.name, required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        onPressed: () {
          widget.onPressed();
        },
        child: Text(widget.name),
      ),
    );
  }
}
