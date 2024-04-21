import 'package:flutter/material.dart';
import 'package:sutori_app/home_screen.dart';

void main() {
  runApp(const SutoriApp());
}

class SutoriApp extends StatelessWidget {
  const SutoriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yokmeet App',
      home: HomeScreen(),
    );
  }
}
