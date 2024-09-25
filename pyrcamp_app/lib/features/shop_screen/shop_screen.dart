import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  //constructor
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pyrcamp Shop'),
      ),
      body: const Center(
        child: Text('tu bedzie sklep'),
      ),
    );
  }
}
