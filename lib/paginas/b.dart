import 'package:flutter/material.dart';

class B extends StatelessWidget {
  const B({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B'),
        backgroundColor: Colors.green,
      ),
    );
  }
}