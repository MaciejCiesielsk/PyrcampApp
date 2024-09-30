import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAP'),
      ),
      body: Center(
        child: Text('TESTTTTTTT', style: TextStyle(color: Colors.pink, fontSize: 30),),
      ),
    );
  }
}