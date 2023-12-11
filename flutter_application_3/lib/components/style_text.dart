import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText({super.key, this.text = "Hello gagal"});
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
