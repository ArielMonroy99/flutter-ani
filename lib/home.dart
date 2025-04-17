import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
        backgroundColor: Colors.blue,
      ),
      body: Align(
        alignment: Alignment(0, 0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          width: 250,
          height: 250,
          color: Colors.deepPurple,
          transform: Matrix4.rotationZ(flag ? pi : 0),
          curve: Curves.easeOutCirc,
          transformAlignment: Alignment(0, 0),
        ),
      ),
      floatingActionButton: FloatingActionButton( onPressed: (){
        setState(() {
          flag = !flag;
        });
      },
      child: Icon(Icons.rotate_90_degrees_ccw),),
    );
  }
}
