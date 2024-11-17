import 'package:flutter/material.dart';

class StoreBidPage extends StatelessWidget {
  // bid id
  final String id;

  const StoreBidPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid'),
      ),
      body: Center(child: Text('Manage this bid here')),
    );
  }
}
