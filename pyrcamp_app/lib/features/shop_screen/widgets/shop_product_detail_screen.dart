import 'package:flutter/material.dart';

class ShopProductDetailScreen extends StatelessWidget {
  const ShopProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('details'),
      ),
      body: const Center(
        child: Text('tu beda szczegoly produktu'),
      ),
    );
  }
}
