import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color.fromARGB(255, 249, 148, 148),
        //   title: const Center(
        //     child: Text("Aplikasi Baru"),
        //   ),
        // ),
        body: GradientContainer.warnaGradient(),
      ),
    ),
  );
}
