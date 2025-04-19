import 'package:flutter/material.dart';
import '../models/esfera.dart'; // la clase de arriba

class MovingSphere extends StatefulWidget {
  final Esfera esfera;
  final VoidCallback onTap;

  const MovingSphere({super.key, required this.esfera, required this.onTap});

  @override
  State<MovingSphere> createState() => _MovingSphereState();
}

class _MovingSphereState extends State<MovingSphere> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          widget.esfera.moveRandom();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment(widget.esfera.x, widget.esfera.y),
      duration: Duration(milliseconds: 1500),
      curve: widget.esfera.curve,
      onEnd: () {
        setState(() {
          widget.esfera.moveRandom();
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: widget.esfera.color,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
