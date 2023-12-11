import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 96, 96, 96),
      title: const Center(
        child: Text("Aplikasi Baru"),
      ),
    );
  }
}
