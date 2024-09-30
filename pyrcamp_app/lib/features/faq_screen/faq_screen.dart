import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Bilety', style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Nocleg', style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Infrastruktura', style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sklep online i namioty', style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
